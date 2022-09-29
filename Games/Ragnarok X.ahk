global assistEnabled:=true
global tapEnabled:=true
global buyEnabled:=false
global hasEnemy:=false
global isFastForward:=false
global clickerEnabled:=false
global inRecovery:=false
global mined:=0
global maxMined:=25
global fish:=0
global maxFish:=10
global needBuyItem:=false
global needMagicBait:=false
global needUpgradeStats:=false
global needUpgradeItem:=false
global statsPointRecommendClicked:=false
global emptyOdinBlessing:=false
global doingCocMission:=false

#Include ../___Basic.ahk

!p::ExitApp
!9::
	assistEnabled:=false
	SoundBeep 350, 100
Return
!0::
	SetKeyDelay, 0, 10
	SetMouseDelay, 1, 1
	assistEnabled:=true
	SoundBeep 350, 100
	while(assistEnabled){
		if(fishing()) 
			Continue

		closeTeamViewerDialog()
		chatResponses()

		;Skip long text
		if(1427, 1050, 0xC7C7D8)
			clickWhen(1379, 1045, 0xA8E967, 0, 0)

		;Skip chat flow
		if(c(1368, 23, 0x755F71) && c(1362, 29, 0xFFFFFF))
			click(1362, 29)
		
		if(actions())
			Continue
		if(resurrect()) 
			Continue

		acceptInvitation()

		if(manageStats())
			Continue
		if(manageBackpack())
			Continue

		;Don't start quest or attack o
		if(goToMusicFairy())
			Continue

		if(manageSubmitItem())
			Continue
		if(lowHealth()&&!inRecovery){
			inRecovery:=true
			disableAutoAttack()
			useFaintDeath()
			runaway()
			Sleep 8000
			;Use first aid to stop runaway
			click(1270, 925)
			Sleep 500
			click(1270, 925)
		}
		else if(inRecovery){
			;enableSelfHealing()
			useFirstAid()
			if(fullHp()){
				;disableSelfHealing()
				inRecovery:=false
			}
		}
		else {
			quests()
			attack()
		}

		;Skip cinematic
		if(c(1312, 20, 0xFFFFFF) && c(1403, 28, 0xF7F9FB))
			click(1312, 20)

		;Equip or receive in dialog
		equipOrReceiveDialog()

		;Stample
		if(c(1324, 678, 0xF4B296))
			click(1324, 678)

		openedBook()
		upgradeAtShop()
		smelting()

		confirmDialogs()

		;Ask quiz (random answer)
		if(c(831, 976, 0xDA7C9A) && c(1078, 974, 0x849FE1)){
			Random rand, 0, 1
			if(rand==0)
				click(799, 961)
			else
				click(1119, 964)
		}

		takePicture()
		pickCrystal()
		if(manageMissionBoard())
			Continue
		if(setupOdinsBlessing())
			Continue
		craftWardrobe()
		claimRewards()
		if(manageQuestList())
			Continue
		if(manageSkills())
			Continue
		if(manageStore())
			Continue
		if(mining())
			Continue
		if(manageRoLife())
			Continue
		if(manageEnchantment())
			Continue
		if(manageWarehouse())
			Continue
		stopPowerSaving()
		if(startGame())
			Continue
		if(confirmCraftFishPrint())
			Continue
		if(closeMap())
			Continue
		if(manageCarnival())
			Continue
		if(manageCocMission())
			Continue
		if(manageVault())
			Continue
		if(manageInsideVault())
			Continue
		if(manageRefinement())
			Continue
		if(manageKingdomPass())
			Continue
		if(manageRecommendStatPoints())
			Continue
		if(manageExchangeCenter())
			Continue
		if(manageChamberOfCommence())
			Continue
		if(manageEndlessTower())
			Continue
		if(manageShortQuestDialog())
			Continue
	}
Return
manageShortQuestDialog(){
	if(c(1012, 739, 0x657CCA) && c(1096, 306, 0xFFBCC3)){
		click(960, 738)
		return true
	}
}
manageEndlessTower(){
	if(c(1285, 71, 0x684F36) && c(1360, 41, 0xE9B7A9) && c(1466, 35, 0xACB3BC)){
		if(clickWhen(1362, 161, 0xFFFFFF, 0, 0))
			click(1465, 33) ;Close dialog
		return true
	}
}
manageChamberOfCommence(){
	;In chamber of commence (has total price)
	if(c(1423, 928, 0xEFA1AE) && c(1290, 934, 0xE9D254)){
		;Purchase
		click(1296, 1002)
		Sleep 100
		click(1411, 36) ;Close dialog
	}
}
enableSelfHealing(){
	if(clickWhen(1112, 928, 0xFFFFFF, 0, 0)){	
		Sleep 500
		;Autoattack setting
		click(1381, 714)
		Sleep 1000
		;Disable normal attack
		clickWhen(1255, 698, 0xA0B984, 0, 0)
		;Disable skills
		clickWhen(1027, 473, 0xA1CDA1, 0, 0)
		clickWhen(1124, 472, 0xA6CFA2, 0, 0)
		clickWhen(1207, 471, 0x99C293, 0, 0)
		clickWhen(1289, 472, 0x9DC697, 0, 0)
		;Close dialog
		click(1301, 309)
		Sleep 100
		click(1370, 772)
	}
}
disableSelfHealing(){
	;Disable auto attack first
	if(clickWhen(1113, 930, 0x33AAEE, 0, 0))
		Sleep 100
	;Click auto attack
	if(clickWhen(1112, 928, 0xFFFFFF, 0, 0)){	
		Sleep 500
		;Autoattack setting
		click(1381, 714)
		Sleep 1000
		;Enable normal attack
		clickWhen(1279, 688, 0x8B8293, 0, 0)
		;Enable skills
		clickWhen(1043, 472, 0x9A9FA0, 0, 0)
		clickWhen(1125, 472, 0x999F9F, 0, 0)
		clickWhen(1207, 471, 0x9A9A9A, 0, 0)
		clickWhen(1289, 472, 0x979C9C, 0, 0)
		;Close dialog
		click(1301, 309)
		Sleep 100
		;Close auto attack
		click(1111, 931)
	}
}
manageExchangeCenter(){
	;In exchange center
	if(c(1219, 32, 0xB88C51) && c(1339, 25, 0xEDEEEF) && c(1411, 37, 0xA5A7B6)){
		;Close dialog
		click(1410, 38)
	}
}
manageRecommendStatPoints(){
	;In recommended stats point
	if(c(731, 735, 0x6FBBEB) && c(1022, 393, 0x86B7E3) && c(1252, 398, 0x86B6E3)) 
		click(1195, 715) ; Click AFK Farming recommendation
}
manageKingdomPass(){
	;In kingdom pass
	if(c(600, 23, 0x9790CF) && c(550, 25, 0x8D93BF) && c(1413, 37, 0xA8A8B8)){
		;Quick claim
		if(clickWhen(1474, 772, 0xFF6D8E, 0, 0))
			return true
		;Claim second reward
		if(clickWhen(1376, 525, 0xC4DF83, 0, 0))
			return true
		;Season
		if(clickWhen(1295, 317, 0xFF6E8D, 0, 0))
			return true
		;Challenge
		if(clickWhen(1474, 772, 0xFF6D8E, 0, 0))
			return true
		;Quests
		if(clickWhen(506, 533, 0xFF6D8E, 0, 0))
			return true

	}
	return false
}
goToMusicFairy(){
	if(inMainPage()&&!fullHp()){
		;If is in ressurection spot
		if(isColorS(1356, 151, 0x9F8E8B, 32) && isColorS(1346, 122, 0xA19287, 32) && !isColorS(1482, 116, 0x5B504A, 32)){
			click(1386, 107)
			Sleep 1000
			clickWhen(1024, 126, 0xEAE4EF, 0, 0)
			Sleep 500
			click(910, 393)
			Sleep 5000
			return true
		}
	}
	return false
}
manageRefinement(){
	if(c(479, 333, 0xEDF1F1)&&c(1135, 702, 0x9A9B9E)&&c(1460, 261, 0xEE7595)){
		clickWhen(1373, 738, 0x8FB7E9, 0, 0)
		Sleep 2000
		click(1457, 270)
		return true
	}
	return false
}
manageVault(){
	;In sewer vault
	if(c(476, 48, 0xABB1B8) && c(1339, 41, 0xFFFFFF) && c(1411, 771, 0x6BB5E9)){
		;If not auto match, click
		if(c(1196, 759, 0xD3DAEE) && c(1277, 758, 0xD7DEF0)){
			click(1238, 760)
			Sleep 2000
		}
		;Go to party list
		click(1062, 757)
		return true
	}
	;In form party, close dialog
	if(c(606, 783, 0x6AB3EA) && c(808, 757, 0xECC56A) && c(1399, 269, 0xEA6A89)){
		click(1399, 284)
	}
	;In Ready lobby 
	if(c(1449, 49, 0xA6AAB6) && c(852, 719, 0xFFD97D)){
		;Search reject button
		PixelSearch, Px, Py, 1074, 292, 1143, 700, 0xCF7882, 4, RGB Fast
		If !ErrorLevel{
			click(1447, 52)
			Sleep 500
			return true
		}
		;Search ready button
		PixelSearch, Px, Py, 1074, 292, 1143, 700, 0x779EE7, 4, RGB Fast
		If !ErrorLevel{
			click(Px, Py)
			Sleep 500
			return true
		}
		return false
	}
	;In party list
	if(c(1028, 327, 0xC5E47B)&&c(1413, 268, 0xEA6D8B)){
		;If party is not full (only 3), leave party
		if(c(1146, 524, 0xD6D5D7))
			leaveParty()
		;If i'm the leader and party is full, enter directly
		if(c(948, 788, 0x7E97E1) && !c(1146, 524, 0xD6D5D7)){
			clickWhen(1415, 270, 0xD0687B, 0, 0)
			Sleep 500
			clickWhen(1468, 753, 0x839BDD, 0, 0)
		}
		return true
	}
	;TODO In party, but has pouring menu, leave party nad back to quest
	if(c(533, 408, 0x97E82C) && inMainPage() && c(1298, 28, 0x5B8EE7)){
		click(443, 561)
		return true
	}

	;In party tab, back to quest tab
	if(c(501, 458, 0xFFFFFF)&&c(506, 476, 0x5C8EDF)){
		click(441, 472)
		return true
	}
	return false
}
isChanneling(){
	return c(879, 878, 0xD97ED2)
}
leaveParty(){
	click(1337, 780)
	Sleep 1000
	click(1052, 628)
}
manageInsideVault(){
	;Has leave button and in party tab
	if(c(1311, 144, 0xFEB447)&&c(454, 565, 0xD4BBCC)){
		;Toggle follow (1,2,3,4 member)
		enableAutoAttack()
		Random rand, 0, 3
		if(rand==0)
			clickWhen(625, 409, 0x5B8EE5, 0, 0)
		else if(rand==1)
			clickWhen(625, 457, 0x5C8EE7, 0, 0)
		else if(rand==2)
			clickWhen(626, 504, 0x5B90E9, 0, 0)
		else
			clickWhen(625, 409, 0x5B8EE5, 0, 0)
		enableAutoAttack()
		return true
	}

	;Exit isntance (after match)
	if(clickWhen(963, 1064, 0x6AB2EB, 0, 0)){
		click(458, 398)
		return true
	}

	;Skip
	if(c(1299, 43, 0xEFF1F4)&&c(1262, 39, 0xD3E1F1)){
		click(1279, 42)
		return true
	}
	return false
}
manageSubmitItem(){
	if(c(1337, 270, 0x796F71) && c(1465, 270, 0xEF6F90)){
		;Handover item
		if(clickWhen(1288, 773, 0x74BCE8, 0, 0)){
			Sleep 1000
			;If handover item still showup, navigate item
			if(c(1287, 771, 0x6CB5EA)){
				click(1154, 470)
				navigateGetItem()
			}
			;Close submit item dialog
			clickWhen(1462, 268, 0xF880A1, 0, 0)
			return true
		}

		;How to obtain (stright forward at left) (need buy item)
		if(c(945, 396, 0xC9C9C9)){
			;If exchange center, pick second option
			if(c(893, 465, 0xBC9692)){
				click(954, 544)
			}
			;Pick first option
			else
				click(960, 452)
			needBuyItem:=true
			return true
		}
		;View source
		clickWhen(1108, 539, 0xFFAFB7, 1282, 745)
		return true
	}
	return false
}
manageCocMission(){
	if(c(863, 26, 0xBE6365)&&c(1074, 31, 0x684F36)&&c(1471, 23, 0xF37D9E)){
		
		Random rand, 0, 2
		if(rand==0){
			clickWhen(607, 748, 0x79BEE8, 0, 0)
		}
		else if(rand==1){
			clickWhen(896, 731, 0xA6CFF1, 0, 0)
		}else{
			click(1319, 724)
		}
		Sleep 1000
		clickWhen(1469, 37, 0xF9F9FF, 0, 0)
		return true
	}
	return false
}
manageCarnival(){
	if(c(1027, 284, 0xFFFFFF)&&c(1076, 272, 0xBD3026)&&c(1439, 274, 0xFEBEC4)){
		;Activity 20
		if(!c(753, 778, 0xF0AB2D)){
			click(764, 749)
			return true
		}
		;Activity 40
		if(!c(897, 802, 0xF5AB27)){
			click(902, 776)
			return true
		}
		;Activity 60
		if(!c(1038, 718, 0xF6AD28)){
			click(1044, 742)
			return true
		}
		;Activity 80
		if(!c(1176, 736, 0xF6AB28)){
			click(1187, 753)
			return true
		}
		;Activity 100
		if(!c(1302, 765, 0xF4AB28)){
			click(1327, 760)
			return true
		}

		;Click mission board
		if(!c(966, 647, 0x46F049)){
			click(966, 625)
			return true
		}
		;Click COC Mission
		if(!c(574, 495, 0x4AF45B)){
			click(574, 495)
			doingCocMission:=true
			return true
		}
		;Daily instance
		if(!c(1312, 369, 0x44ED55)){
			click(1310, 348)
			return true
		}
		
		;Empty odin's blessing
		;Close carnival dialog
		click(1443, 285)
		emptyOdinBlessing:=true
		return true
	}
	return false
}
closeMap(){
	if(c(971, 86, 0x775E98)&&c(1441, 14, 0x594234)){
		click(1466, 73)
		return true
	}
	return false
}
confirmCraftFishPrint(){
	if(c(783, 415, 0xCD8EEA)&& c(1157, 518, 0xF1C88D)){
		clickWhen(1048, 578, 0x8DBEEE, 0, 0)
		Sleep 1000
		click(1048, 631)
		return true
	}
	return false
}
startGame(){
	;Close news
	;In ROX title
	if(c(726, 1048, 0xA7D960))
		return clickWhen(871, 675, 0x96ADDF, 963, 1003)
	if(c(467, 49, 0xA6ABB6))
		return clickWhen(497, 1024, 0xDB7B8E, 974, 1028)
	return false
}
manageWarehouse(){
	if(c(877, 293, 0x92C3D7)&&c(1341, 290, 0x71ABDB)&&c(1410, 275, 0xEF6D8D)){
		click(1412, 289)
		return true
	}
	return false
}
manageEnchantment(){
	;In enchantment page
	if(c(1286, 303, 0xACB3BD) && c(1153, 290, 0xE3E3ED) && c(1459, 259, 0xF683A4)){
		if(clickWhen(1376, 739, 0x93B4E8, 0, 0)){
			Sleep 1000
		}
		return true
	}

	;In equipment enchanting dialog
	if(c(1249, 283, 0xCFBDF7) && c(1221, 379, 0xD79379)){
		click(1217, 391)
		;Close
		Sleep 1000
		click(1460, 271)
		return true
	}
	return false
}
manageRoLife(){
	if(c(608, 321, 0x86A1AE) && c(1438, 281, 0xFFBDC3)){
		return clickWhen(1434, 306, 0xFFFFFF, 0, 0)
	}
	return false
}
mining(){
	hasAxe:=c(1176, 1044, 0xF6EBFD)
	hasLevelActivity:=c(667, 1058, 0xD6D6DE)
	if(hasAxe && hasLevelActivity){
		;Start mining
		if(clickWhen(1369, 939, 0xD7D7F0, 0, 0)){
			mined:=0
			return true
		}
		;Got mined
		if(c(1320, 861, 0xF7D6F7)){
			mined:=mined+1
			Sleep 1000
			return true
		}
		;Stop mining
		if(mined<maxMined){
			click(1369, 939)
			manageQuestList()
			return true
		}
	}
	return false
}
runaway(){
	click(1440, 117)
	Sleep 500
	;If in channel sewer
	if(c(1169, 392, 0x4E5254)){
		clickWhen(847, 121, 0x554A71, 0, 0)
		Sleep 500
		if(clickWhen(843, 198, 0xE2F5FC, 0, 0)){
			click(843, 198)
			Sleep 5000
		}
	}
	else{
		;Click random spot
		click(835, 127)
		Sleep 100
		click(900, 164)
		Sleep 100
		click(900, 164)
		Sleep 100
		click(900, 164)
		;Close map
		click(1468, 75)
	}
}
manageStore(){
	if(c(1343, 252, 0xF3BC5D) && c(1447, 269, 0xF783A4)){
		Sleep 1000
		if(needBuyItem && c(956, 382, 0x9F9398)){
			buyItem(29)
			return true
		}
		click(1443, 290)
		return true
	}
	return false
}
buyItem(qty){
	Loop %qty% {
		click(955, 622)
		Sleep 100
	}
	clickWhen(926, 758, 0x6CB6E9, 0, 0)
	Sleep 500
	needBuyItem:=false
}
acceptInvitation(){
	if(c(820, 153, 0xF1D98E))
		return clickWhen(899, 112, 0xFFF4FF, 820, 153)
	return false
}

useFaintDeath(){
	click(1438, 834)
	Sleep 100
	click(1438, 834)
	Sleep 3000
}
stopPowerSaving(){
	if(isColorS(941, 534, 0xD1D2D1, 16)&& isColorS(958, 464, 0x908E90, 16)){
		click(964, 543)
		return true
	}
	return false
}
resurrect(){
	if(c(1198, 959, 0xFFC0CD)){
		clickWhen(1325, 1027, 0x76BEE8, 0, 0)
		needUpgradeItem:=true
		needUpgradeStats:=true
		return true
	}
	return false
}
closeTeamViewerDialog(){
	if(c(732, 518, 0x008CF5))
		clickWhen(1193, 582, 0xF5F7F8, 1147, 582)
}
manageBackpack(){

	;In backpack
	if(c(619, 794, 0x9AA3C4) && c(741, 783, 0x687091)){
		;Upgradable Item 1
		if(clickWhen(818, 386, 0xFF6E8D, 894, 402))
			return true

		;Upgradable Item 5
		if(clickWhen(618, 384, 0xFF6E8E, 550, 405))
			return true

		return clickWhen(1462, 28, 0xE5E5EF, 0, 0)
	}

	;In item dialog
	if(c(765, 331, 0xED612F) && c(988, 340, 0xF4F4FB)){ 
		;Upgrade item
		if(clickWhen(1170, 555, 0xFE6D8E, 1106, 575))
			return true
	}

	;Click backpack
	if(needUpgradeItem && fullHp() && !isPathFinding()){
		return clickWhen(1404, 205, 0xFF6E8D, 0, 0)
	}

	return false
}
manageSkills(){
	if(clickWhen(1481, 206, 0xFF6D8E, 0, 0)) ;Click back
		Sleep 1000
	clickWhen(1381, 789, 0xFE6E8C, 0, 0) ;Select skill
	if(c(616, 75, 0x73A4E6) && c(1410, 36, 0xA3A5B6)){ ; In skill page
		if(clickWhen(1413, 705, 0x93BA5E, 0, 0)){ ;Click done recommend
			Sleep 1000
			click(1409, 38) ; Then close
			Sleep 1000
			click(1462, 225) ; Then close back button
		}
		clickWhen(1446, 627, 0x819AE3, 0, 0) ; Recommend points
	}
}
craftWardrobe(){
	if(c(1266, 356, 0xFFD57E) && c(1476, 289, 0xE76686)){
		clickWhen(1306, 752, 0x8FC0EF, 0, 0)
	}
	;Equip wardrobe
	if(c(868, 772, 0xDC8277))
		clickWhen(1148, 768, 0x7D9AE5, 0, 0)
}
claimRewards(){
	;claimRewardsAtAcademyHandbook()

	;Has pouring reward
	;if(clickWhen(1313, 18, 0xFF6E8D, 0, 0))
	;	return
}
;TODOLater Scrollable reward
claimRewardsAtAcademyHandbook(){
	;Has academy handbook reward
	if(clickWhen(1257, 19, 0xFF6E8D, 0, 0))
		return

	;In academy handbook dialog
	if(c(521, 351, 0xBA824A) && c(1413, 294, 0xFFBDC3)){
		clickedRightSection:=false

		;Search claimable
		PixelSearch, Px, Py, 1247, 322, 1320, 795, 0x82A2EA, 4, RGB Fast
		If !ErrorLevel{
			click(Px, Py)
			clickedRightSection:=true
			return
		}

		;Search notification dot at right section
		PixelSearch, Px, Py, 1302, 323, 1336, 774, 0x8E6EFF, 4, Fast
		If !ErrorLevel{
			click(Px, Py)
			clickedRightSection:=true
			return
		}

		;Close expandable
		if(!clickedRightSection){
			;Search purple dot, then close expandable on top of it
			PixelSearch, Px, Py, 1222, 326, 1258, 783, 0xA87DA7, 4, RGB Fast
			If !ErrorLevel{
				click(Px, Py-90)
				return
			}else{
				
			}
		}

		;Search notification dot at left section
		PixelSearch, Px, Py, 590, 568, 936, 767, 0x8E6EFF, 4, Fast
		If !ErrorLevel{
			click(Px-20, Py+20)
			return
		}
	}
}
setupOdinsBlessing(){
	if(!emptyOdinBlessing)
		return false
	if(inMainPage() && !isPathFinding())
		click(688, 51)

	;In odin blessing dashboard
	if(c(638, 304, 0x4499FF)&&c(1299, 304, 0xE7668A)){
		;Disable odin's blessing when empty
		if(!c(751, 633, 0x7ADD41)){
			emptyOdinBlessing:=false
			;Close dialog
			click(1285, 315)
		}

		;Activate odin blessing
		clickWhen(959, 719, 0x3996FF, 0, 0)

		;Recommended training points
		clickWhen(1197, 764, 0xDD9B59, 0, 0)
		return true
	}

	;In odin blessing recommended training points
	if(c(554, 291, 0x439EFE) && c(971, 300, 0x7899CB) && c(1372, 290, 0xEB669C)){
		Loop 3{
			drag(952, 381, 957, 733)
			Sleep 100
		}
		Sleep 1000
		;Search recommended monster
		PixelSearch, Px, Py, 552, 335, 1374, 763, 0xA9E1A4, 4, RGB Fast
		If !ErrorLevel{
			click(Px+320, Py-40)
			Sleep 500
			if(!isPathFinding())
				enableAutoAttack()
			return true
		}
	}

	return true
}
manageMissionBoard(){
	;In quest picker
	if(c(958, 31, 0x92816C)&&c(1454, 49, 0xA9AEB7)){
		;New missions
		PixelSearch, Px, Py, 617, 269, 1457, 667, 0xEF6D9A, 2, RGB Fast
		If !ErrorLevel{
			click(Px-20, Py+20)
			Sleep 500
			return true
		}

		;Completed missions
		PixelSearch, Px, Py, 484, 425, 1445, 759, 0x6591E7, 4, Fast
		If !ErrorLevel{
			click(Px, Py)
			Sleep 500
			return true
		}

		;Close if mission all completed
		if(c(1459, 53, 0xADB1BA)){
			click(1452, 48)
		}
		return true
	}
	;In single quest picker
	if(c(1086, 420, 0xFFFFFF)&&c(1112, 420, 0xD3C9A6)){
		clickWhen(972, 709, 0xEED672, 1454, 45)
		return clickWhen(1041, 722, 0x8099E3, 0, 0)
	}
	return false
}
manageQuestList(){
	;In daily quest dialog
	if(c(1005, 292, 0x796E71) && c(1287, 289, 0xE66788)){
		foundQuest:=false

		if(noQuest()){
			goToCarnival()
			foundQuest:=true
			return
		}

		;Search job quest
		PixelSearch, Px, Py, 634, 353, 682, 699, 0x92B4F2, 16, RGB Fast
		If !ErrorLevel{ 
			selectQuestFromQuestList(Px, Py)
			foundQuest:=true
		}

		;Search daily quest
		PixelSearch, Px, Py, 634, 353, 682, 699, 0xDF91F7, 32, RGB Fast
		If !ErrorLevel{ 
			selectQuestFromQuestList(Px, Py)
			foundQuest:=true
		}

		;Search side quest
		PixelSearch, Px, Py, 631, 348, 682, 699, 0xADC25F, 16, RGB Fast
		If !ErrorLevel{ 
		;	selectQuestFromQuestList(Px, Py)
		;	foundQuest:=true
		}

		;Search tutorial quest
		PixelSearch, Px, Py, 631, 348, 682, 699, 0xF47B7D, 16, RGB Fast
		If !ErrorLevel{ 
			selectQuestFromQuestList(Px, Py)
			foundQuest:=true
		}

		;Click go button
		if(!foundQuest){
			goToCarnival()
		}
	}
}
noQuest(){
	return (c(851, 512, 0xFFAFB7)&&c(896, 596, 0xFBB871))
}
goToCarnival(){
	;Close quest
	click(1269, 298)
	Sleep 1000
	;Open pouring menu to open carnival
	if(!c(1171, 26, 0x8E5C86)){
		clickWhen(1295, 27, 0x5A8CE6, 0, 0)
		Sleep 1500
	}
	;Open carnival
	clickWhen(1171, 24, 0x926185, 0, 0)
	Sleep 1500
}
selectQuestFromQuestList(x, y){
	click(x, y)
	Sleep 500
	checkIfQuestNeedMagicBait()
	;Go
	click(1185, 748)
	Sleep 500

	;Enable auto attack when not path finding
	if(!isPathFinding())
		enableAutoAttack()
}
checkIfQuestNeedMagicBait(){
	if(c(895, 512, 0xCE5B43) && c(881, 637, 0xD88671)){
		needMagicBait:=true
		return true
	}
	return false
}
unFocusQuest(){
	SetMouseDelay 20
	MouseClickDrag L, 552, 536, 556, 417
	SetMouseDelay -1
}
goToQuestList(){
	Sleep 1000
	click(438, 467)
	Sleep 1500
}
pickCrystal(){
	;If in sewer vault
	if(c(429, 15, 0x4E3859) && c(476, 48, 0xACB1BA)){
		click(947, 653)
	}
	if(c(475, 38, 0xE6E7EF)){
		;If crystal selected, click activate
		if(c(925, 870, 0xFFFB84)&&c(838, 960, 0xBCE667)){
			click(838, 960)
			Sleep 2000
			;Press hold the crystal
			Send, {LButton Down}
			Sleep, 5000
			Send, {LButton Up}
		}
	}
}
takePicture(){
	;Take picture with pink button
	if(c(1198, 1010, 0xFF77AA) && c(1440, 1014, 0xFF77AA)){
		clickWhen(1443, 1004, 0xFF77AA, 0, 0)
	}
	;Close share dialog
	if(c(746, 815, 0x3C56A0) && c(958, 823, 0x3FC63E)){
		click(1283, 246)
		click(461, 31)
	}
}

actions(){
	if(inMainPage()){
		;Rescue
		if(isColorS(1147, 235, 0xEFE3BE, 16)){
			clickAction()
			return true
		}
		;Action climb / ride
		if(c(1135, 244, 0xB08751)){
			clickAction()
			return true
		}
		if(c(1151, 221, 0xEFE3BE)){
			clickAction()
			return true
		}

		;Action Observe
		if(isColorS(1156, 233, 0xFAFAEF, 16)){
			clickAction()
			return true
		}
		;Action ride
		if(c(1151, 801, 0xEDE5C4)){
			click(1090, 714)
			click(1154, 793)
			Sleep 2000
			return true
		}
		;Action read (below lower)
		if(isColorS(1160, 805, 0xEFE3BE, 16)){
			click(1148, 800)
			Sleep 2000
			return true
		}
		;Action play
		if(isColorS(1157, 800, 0xEEE3BF, 16)){
			click(1153, 806)
			Sleep 2000
			return true
		}
		;Action fish
		if(isColor(1093, 723, 0xEDE4C2)){
			click(1095, 711)
			Sleep 2000
			return true
		}
		;Action leave ride
		if(isColorS(1435, 837, 0xEBE3C3, 16)){
			click(1432, 841)
			Sleep 2000
			return true
		}
		;Action minigame
		if(isColor(1173, 802, 0xFDF4E5)){
			click(1155, 802)
			Sleep 2000
			return true
		}
		;Action gathering
		if(isColor(1097, 710, 0xEFE3BE)){
			click(1089, 708)
			Sleep 6000
			return true
		}
	}
	return false
}
inMainPage(){
	return isColorS(546, 45, 0xD2DDEE, 16)|| isColor(1298, 896, 0xD7D5DC)
}
confirmDialogs(){
	;Confirm scroll dialog
	if(c(1453, 46, 0xA7AAB6) && c(1252, 631, 0x82A4E4) && c(1034, 617, 0x8099E3)){
		click(993, 616)
		return true
	}
	;Confirm short floating dialog
	if(c(1140, 299, 0xFFBCC3) && c(1109, 756, 0xB2AAA8)){
		click(1140, 299)
		return true
	}
	;Close locations dialog
	if(c(1049, 350, 0x78BADB) && c(1165, 351, 0xE7668A)){
		click(1142, 353)
		return true
	}
	;Close event dialog
	if(c(849, 294, 0xFDFDFC) && c(1070, 297, 0xFFFFFF)){
		click(1414, 309)
		return true
	}
	;Confirm leave area
	if(c(1000, 419, 0x796E71) && c(1179, 410, 0xE7668A) && c(924, 625, 0xE09F55)){
		click(1046, 630)
		return true
	}
	;Confirm registration 
	if(c(1057, 365, 0x6DEDF8) && c(1422, 694, 0xA75F43)){
		click(1330, 666)
		return true
	}
	;Confirm exchange center description
	if(c(1217, 378, 0xE9817D) && c(1177, 264, 0xF47995)){
		clickWhen(965, 732, 0x69B5EB, 0, 0)
		;Confirm exhange center sign agreement
		return clickWhen(827, 707, 0xE09F99, 1166, 284)
	}


	;Confirm retry connection
	if(c(909, 414, 0x796E71) && c(1047, 424, 0xEBE5F3)){
		clickWhen(1006, 612, 0x8AB2EB, 0, 0)
		return true
	}
	;Confirm news dashboard dialog
	if(c(1203, 326, 0xC7A386) && c(1378, 312, 0xE56396)){
		clickWhen(1377, 299, 0xF9F9FF, 0, 0)
		return true
	}


	;Confirm news dashboard dialog
	if(c(804, 319, 0xFAFAFA)&&c(1114, 292, 0xFFBDC3)){
		clickWhen(963, 752, 0x55A0D1, 0, 0)
		return true
	}
	;Confirm rewards kingdom pass dialog
	if(c(648, 618, 0xF7726E) && c(1069, 412, 0xFBB9D5) && c(1043, 603, 0xF5F4EF)){
		click(959, 607)
		return true
	}
	;Back from webview
	if(c(1461, 101, 0x333333) && c(1313, 1028, 0x333333) && c(1296, 1017, 0xC8C8C8)){
		click(1393, 1028)
		return true
	}
	if(c(1418, 296, 0xEF7495) && c(957, 307, 0xF7F1E7)){
		click(1418, 296)
		return true
	}
	return false
}

equipOrReceiveDialog(){
	if(c(1201, 573, 0x819AE2))
		click(1201, 573)
	if(c(1225, 451, 0xEA6486))
		clickWhen(1193, 579, 0x819AE4, 0, 0)
}
manageArmWrestling(){
	;In wresting 1242, 292, 0xE34B4B
	;Invitation 576, 345, 0xC9C9C9
	;Accept 809, 404, 0x9DC976

	;1352, 1020, 0xFAB560
}
chatResponses(){
	if(c(1399, 1058, 0xD6CCE6)||c(1425, 1021, 0xE5E1EC)){
		;Has chat guidance box
		if(c(1240, 762, 0xE2F0FF))
			click(1354, 780)
		;Chat fourth response
		else if(c(1359, 708, 0xFBF1A6))
			click(1359, 708)
		;Chat third response
		else if(c(1362, 762, 0xFFF1BF))
			click(1358, 785)
		;Chat third green response
		else if(c(1362, 764, 0xE1F7A2))
			click(1353, 785)
		;Chat second blue response
		else if(c(1361, 821, 0xA4D9FF)){
			if(doingCocMission){
				click(1357, 896)
				doingCocMission:=false
			}
			else{
				click(1363, 837)
			}
		}
		;Chat second yellow response
		else if(c(1364, 824, 0xFFEEAA))
			click(1363, 837)
		;Chat second green response
		else if(c(1361, 823, 0xE0F7A2))
			click(1363, 837)
		;Chat second response
		else if(c(1363, 823, 0xFBF1A5))
			click(1363, 823)
		;Chat main response
		else if(c(1369, 880, 0xFEEFA9))
			click(1369, 902)
		;Chat green response
		else if(c(1354, 881, 0xE0F7A2))
			click(1369, 902)
		;Chat blue response
		else if(c(1367, 913, 0xA2CBFF))
			click(1369, 902)
		;Chat white single response
		else if(c(1352, 879, 0xF3F1F6))
			click(1352, 879)
		else
			click(1390, 1054)
	}
}

smelting(){
	;In action smelting / cooking dialog
	if(c(926, 322, 0xD9C5C8)){
		;Click smelting
		if(clickWhen(1044, 764, 0x87A9ED, 0, 0)){
			Sleep 800
			;If button still showing up 
			if(c(1044, 764, 0x87A9ED)){
				findCostObtainRecommendation()
			}
			else{
				;Close smelting dialogs
				click(1435, 313)
				click(1436, 307)
				click(1436, 307)
			}
		}
		return true
	}
	return false
}
findCostObtainRecommendation(){
	PixelSearch, Px, Py, 848, 637, 1017, 720, 0xF3A6A8, 4, RGB Fast
	If !ErrorLevel{
		click(Px-20, Py)
		Sleep 500
		;How to obtain at cooking / smelting
		if(c(1331, 371, 0xFFF4FF)){
			;If is exchange center
			if(c(1145, 465, 0xBB958E)){
				;Click second option
				click(1133, 543)
			}
			;Click first option
			else
				click(1133, 461)
		}
		return true
	}

	return false
}

fishing(){
	isFishing:=false
	;If not yet fishing (cast button)
	if(c(1310, 879, 0xF4E8E1) && c(1371, 932, 0xE7E2F7)){
		;Bait selection
		if(c(1022, 377, 0x885EA9)){
			click(926, 551)
			click(1341, 916)
		}
		else if(c(1169, 923, 0xDFD5E7)){
			click(1164, 1028)
		}
		;Cast
		else{
			if(needMagicBait){
				useMagicBait()
			}
			click(1341, 916)
		}
		isFishing:=true
	}
	;Is in fishing (level)
	if(c(664, 1061, 0xD3D7DF) &&c(1242, 1044, 0xF1CF9C)){
		;Catch fish
		if(isColorS(1383, 933, 0xC3F36B, 16)||isColorS(1383, 932, 0xC4F36F, 16)||isColorS(1307, 879, 0xCDF776, 16)){
			click(1383, 932)
			fish:=fish+1
			Sleep 1000
			if(fish>=MaxFish){
				clickQuest()
				fish:=0
			}
		}
		isFishing:=true
	}
	return isFishing
}
useMagicBait(){
	click(1168, 1034)
	Sleep 1000
	click(1002, 554)
	click(1168, 1034)
	needMagicBait:=false
}
upgradeAtShop(){
	if(c(1414, 268, 0xEF7391) && c(1133, 482, 0xF3F7FD)){
		;Upgrade all
		click(890, 410)
		Sleep 100
		clickWhen(1393, 743, 0x83ACE6, 0, 0)
		Sleep 100
		click(933, 514)
		Sleep 100
		clickWhen(1393, 743, 0x83ACE6, 0, 0)
		Sleep 100
		click(935, 614)
		Sleep 100
		clickWhen(1393, 743, 0x83ACE6, 0, 0)

		Sleep 100
		click(540, 405)
		Sleep 100
		clickWhen(1393, 743, 0x83ACE6, 0, 0)
		Sleep 100
		click(497, 512)
		Sleep 100
		clickWhen(1393, 743, 0x83ACE6, 0, 0)
		Sleep 100
		click(498, 618)
		Sleep 100
		clickWhen(1393, 743, 0x83ACE6, 0, 0)
		Sleep 100
		click(546, 718)
		Sleep 100
		clickWhen(1393, 743, 0x83ACE6, 0, 0)
		Sleep 1000
		;Close shop
		click(1430, 278)
		return true
	}
	return false
}
quests(){
	if(allowQuest()){
		;Side quest
		if(isColorS(492, 420, 0x8A9F2D, 16)){
			clickQuest()
			return
		}
		if(isColorS(497, 417, 0x859D33, 16)){
			clickQuest()
		}
		;Top quest (line)
		if(isColorS(468, 417, 0x4C83B9, 16)){
			clickQuest()
			return
		}
		;Tutorial quest
		if(isColorS(477, 419, 0xA24240, 16)){
			clickQuest()
			return
		}
		if(isColorS(483, 415, 0xC64C47, 16)){
			clickQuest()
			return
		}
		if(isColorS(483, 415, 0xD65557, 16)){
			clickQuest()
			return
		}
		;Main quest
		if(isColorS(486, 422, 0xBD8650, 16)){
			clickQuest()
			return
		}
		if(isColorS(486, 421, 0xD58E45, 16)){
			clickQuest()
			return
		}
		if(isColorS(477, 420, 0xBC9061, 16)){
			clickQuest()
			return
		}
		if(isColorS(482, 418, 0xD09A5D, 16)){
			clickQuest()
			return
		}
		if(isColorS(483, 416, 0xE99F4B, 16)){
			clickQuest()
			return
		}
	}
}
navigateGetItem(){
	Sleep 1500
	clickWhen(1073, 384, 0xD7D7E8, 0, 0)
	Sleep 500
	;If how to obtain shows up
	if(c(1128, 382, 0xC9C9C9)){
		;If not exchange center
		if(c(1046, 464, 0xC0978F)){
				click(1052, 543)
		}
		else{
			;Pick first option
			click(1141, 450)
			needBuyItem:=true
		}
	}
}

openedBook(){
	if(c(612, 338, 0x695B71)){
		;Need open next page
		if(clickWhen(1433, 513, 0xFAFDFF, 0, 0))
			Return
		;Close book
		clickWhen(1332, 323, 0xFFBCC4, 0, 0)
	}
}

clickAction(){
	click(1160, 239)
	Sleep 3000
}

attack(){
	;Enemy health
	if(!isPathFinding() && (!fullHp() || hasEnemy())){
		;Auto attack monsters
		;enableAutoAttack()
		if(hasEnemy())
			basicAttack()
		useFirstAid()
		;Use odin blessing
		clickWhen(691, 58, 0x739C43, 0, 0)
	} else{
		disableAutoAttack()
	}
}
hasEnemy(){
	return inMainPage() && c(798, 81, 0x383241)
}
toggleAutoAttack(){
	click(1113, 931)
	Sleep 500
	click(1370, 772)
}
autoAttackDisabled(){
	return c(1113, 928, 0xFEFFFF)
}
enableAutoAttack(){
	if(autoAttackDisabled())
		toggleAutoAttack()
}
disableAutoAttack(){
	if(c(1098, 929, 0xDFF0F6)){
		toggleAutoAttack()
	}
}
lowHealth(){
	return inMainPage() && !isColorS(577, 41, 0x85E333, 32)
}
fullHp(){
	return inMainPage()&&c(658, 41, 0xDEF562)
}
basicAttack(){
	click(1388, 980)
}
manageStats(){
	;In profile
	if(c(875, 272, 0x796E71) && c(1385, 275, 0xEF7490)){
		if(!needUpgradeStats){
			click(1408, 284)
			return true
		}
		;Click stats point
		if(clickWhen(1439, 579, 0xDEDCDE, 0, 0)){
			statsPointRecommendClicked:=false
			return true
		}
		;Click checklist
		if(clickWhen(1361, 766, 0xCADB99, 0, 0)){
			needUpgradeStats:=false
			Sleep 500
			return true
		}
		;Click recommend stats point
		if(c(1288, 340, 0xE5BB61)){
			if(statsPointRecommendClicked){
				click(1406, 268)
				needUpgradeStats:=false
			}
			else{
				statsPointRecommendClicked:=true
				click(1292, 338)
			}
			return true
		}
		
		;Click close button
		if(clickWhen(1406, 268, 0xF07697, 0, 0))
			return true
	}

	if(needUpgradeStats && inMainPage()){
		;Click profile
		click(485, 62)
		Sleep 1000
		return true
	}
	return false
}
clickQuest(){
	useFirstAid()
	click(559, 424)
	Sleep 200

	lineActive1 := isColorS(468, 435, 0x6199A5, 16)
	lineActive2 := isColorS(468, 422, 0x4874AB, 16)
	lineActive3 := isColorS(467, 423, 0x669CD3, 16)
	lineActive4 := isColorS(467, 438, 0x79A6CD, 16)
	lineActive5 := isColorS(468, 417, 0x619ABE, 16)
	lineActive6 := isColorS(467, 427, 0x67A4CF, 16)
	lineActive7 := isColorS(468, 420, 0x7A94AD, 16)
	lineActive := lineActive1 || lineActive2 || lineActive3 || lineActive4 ||lineActive5||lineActive6||lineActive7
	;If mission is unselected
	if(c(431, 478, 0xD3B2CB) && !lineActive && allowQuest()){
		;Click quest list
		click(440, 462)
	}
}
useFirstAid(){
	if(!fullHp()&&!isPathFinding()){
	
		clickWhen(1252, 913, 0x779A40, 0, 0)
	}
}
isPathFinding(){
	;Search teleport sign
	;PixelSearch, Px, Py, 703, 329, 1232, 460, 0xC3CBD4, 4, RGB Fast
	;If !ErrorLevel{
	;	return true
	;}
	return isPathFindingWithoutSign()
}
isPathFindingWithoutSign(){
	return isColorS(926, 421, 0xE3FDFC, 16)
}

allowQuest(){
	pathFinding := isPathFindingWithoutSign()
	hasDialog := c(1456, 331, 0xE7E7EB)
	hasUseDialog := c(1194, 454, 0xF0768C)
	fishing := c(1243, 1043, 0xE4C28C) && fish<maxFish
	return !pathFinding && !hasDialog && !hasUseDialog && !lowHealth() && !emptyOdinBlessing && !isChanneling() && !hasEnemy()
}


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