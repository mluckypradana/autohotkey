;AI Base
#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1
loop(){
	if handleOutBluestack(){
		tooltip("Out of bluestacks handled")
		Return
	}
	if handleMc()
		Return
	if handleWa()
		Return
	if handleDailyChest()
		Return
	if handleShop()
		Return
	if sendEmpireChevalierMedal()
		Return
	if claimGrandCollectionToken()
		Return
	if sendBp()
		Return
	if adManaged(){
		tooltip("Ad managed")
		Return
	}
	if handleEvent()
		Return
	if handleInbox()
		Return
	if handleStarlight()
		Return
	if handleGameGuardian()
		Return
	if handleMainMenu()
		Return
}
handleMainMenu(){
	;Change live tab
	if c(1317, 356, 0x172030) && c(1290, 318, 0x45679B) {
		click(1467, 317)
		return true
	}
	;Don't exit game
	if c(1141, 753, 0xD9565E) {
		escape()
		return true
	}
}
handleGameGuardian(){
	if c(1451, 222, 0x666666) && c(1374, 593, 0xFDFDFD) && c(1457, 649, 0x424242) {
		escape()
		tooltip("Escape game guardian")
		return true
	}
	;Close dialog game guardian
	if c(529, 818, 0x424242) && c(567, 818, 0xFFFFFF) && c(494, 249, 0x424242) {
		click(559, 820)
		return true
	}
}
adManaged(){
	;Close white close button ad
	if c(1459, 40, 0x4D4D50) && c(1447, 40, 0xFFFFFF){
		escape()
		return
	}
	;Close background protected ad (logo)
	if c(462, 1037, 0xCFCFCF) && c(451, 1060, 0xFAFAFA) {
		escape()
		return
	}
	;Close ad reward
	if (c(1445, 54, 0xFFFFFF) && c(1428, 51, 0x3C4043) && c(424, 1074, 0x000000)) ;Video ad
	|| (c(1463, 35, 0xFFFFFF) && c(1450, 36, 0x3C4043))	;Video ad Small res
	|| (c(431, 1069, 0x29BBD5) && c(1459, 40, 0x2F2D2B)) ;With info at bottom left
	|| (c(530, 25, 0xE6E6E6) && c(1373, 38, 0xFFFFFF) && c(518, 45, 0x000000)) ;Protected at top left
	|| (c(461, 1026, 0xE6E6E6) && c(1436, 62, 0xFFFFFF) && c(1400, 58, 0x000000)) ;Protected at bottom left
	|| (c(447, 1046, 0xE6E6E6) && c(1460, 39, 0xFEFEFE) && c(1469, 38, 0x181818)) ;Protected at bottom left (small)
	|| (c(1365, 99, 0x5F6368) && c(1377, 101, 0xFFFFFF) && c(465, 103, 0xFFFFFF)) ;Playstore white background
	|| (c(1365, 959, 0x888888) && c(1340, 1015, 0x4B8BA2)) ;Playstore white background
	{
		escape()
		return
	}

	;Close playstore install
	if (c(450, 257, 0x202124) && c(449, 1038, 0x202124) && c(399, 210, 0x000000)) ;Playstore black background
	{
		escape()
		return
	}

	;Close white circle close button
	if c(1448, 40, 0xFED5DF) && c(1459, 40, 0x4C2330) {
		escape()
		return
	}
}
handleInbox(){
	if(c(1274, 361, 0xA8873C) && c(1439, 806, 0xB68A60)) 
		click(1444, 800) ;Claim all BP in inbox
	;Claim BP in inbox
	if(c(1132, 760, 0xE7D981) && c(1334, 766, 0xAA835D))
		click(1335, 771)
	;Claim in inbox detail
	if(c(1346, 282, 0x7DCDFF))
		clickWhen(1325, 760, 0xAE855E, 0, 0)
	if readMails()
		Return
}
readMails(){
	;Has unread messages
	if(c(1466, 330, 0xB53648)){
		clickWhen(1457, 802, 0xA9835C, 0, 0)
	}
}
handleStarlight(){
	if(c(517, 285, 0xC8A2B5) && c(439, 267, 0xFFDEAC)) { ;In starlight page
		if(c(1277, 262, 0xAF3243) && !c(1212, 284, 0xFDF5CC)) ;Click tasks
			click(1277, 262)
		clickWhen(1277, 790, 0x619AFD, 0, 0) ;Claim all rewards

		if(c(944, 261, 0xBD3C4E) && !c(881, 284, 0xFDF5CC)) ;Click rewards
			click(883, 273)
		clickWhen(1409, 776, 0x4959C4, 0, 0) ;Claim all activities
	}
}
handleEvent(){
	if(c(1256, 249, 0xEED277) && c(1368, 254, 0x4564F5)) { ;In draw skin special event
		if(!c(1004, 258, 0x8FBCE8)) ;Skip animation
			click(1004, 258)
		if(c(536, 578, 0xB8394B)) ;Click daily supply
			click(509, 596)
		return
	}
	
	if(c(1071, 242, 0x5BB5DD) && c(1279, 248, 0x4065F9)){ ;In event
		if(isColor(1422, 409, 0x072445)) { ;In daily supply / weekend revelry
			clickWhen(1412, 781, 0xA07D5A, 0, 0) ;Claim fourth reward
			clickWhen(1407, 682, 0xA7815C, 0, 0) ;Claim third reward
			clickWhen(1401, 577, 0xAE855E, 0, 0) ;Claim second reward
			clickWhen(1403, 466, 0xAB845D, 0, 0) ;Claim first reward
		}
		if(c(807, 681, 0xF5E5CC) && c(1044, 673, 0xF9E9D0)) { ;In Weekend benefits
			if !c(866, 788, 0xB39261)? click(868, 773)
			if !c(1095, 789, 0xB39261)? click(1095, 789)
			if !c(1318, 787, 0xB39261)? 
				click(1318, 787)
		}
		if(c(1193, 544, 0xF6E6A4)) { ;Free Lucky Draw
			if(c(639, 384, 0x47F8FF)) ;Skip animation
				click(641, 373)
			if(clickWhen(1140, 588, 0xD0AF6D, 0, 0)){ ;Draw
				waitClick(1029, 673, 0xB78B60)
			}
		}
		return
	}

	;Claim 7-day login reward
	if c(1195, 744, 0x7F5933) && c(1372, 736, 0xA7815C) {
		click(1379, 750)
		return
	}
	;If 7-day login reward claimed, not int match
	if c(1196, 736, 0x444444) && c(1368, 737, 0x434343) && c(960, 101, 0x0B090D) {
		escape()
		return true
	}
	
	;MC daily surprise
	if c(1066, 765, 0x01CEFE) && c(1364, 766, 0xE4E381) && c(499, 567, 0xBE3C4E){
		click(499, 567)
		return
	}
}
handleWa(){
	;Back from whatsapp
	if c(981, 9, 0x999999){
		if c(1223, 854, 0x00CC3F)
		|| c(982, 31, 0x999999)
		|| c(1246, 830, 0x00CC3F)
		|| c(961, 852, 0x20C659)
			escape()
	}
}
handleOutBluestack(){
	;Close fake serial number idm
	if(c(764, 537, 0xFCE100) && c(755, 521, 0x000000)){
		click(1149, 621)
		Return
	}
	;Close fake serial number idm shorter message
	if(c(764, 481, 0x688EB2) && c(788, 543, 0xFCE100)){
		click(959, 535)
		escape()
		Return
	}
}
handleMc(){
	;Claim All MC reward
	if(c(1300, 360, 0xAB8457) && c(1214, 821, 0x25629C))
		click(1214, 821)
	
	;Open MC magic competition
	if(c(443, 820, 0xDDFEFE) && c(516, 637, 0xAF3143))
		click(516, 636)
	;Claim MC coin
	if(c(1144, 359, 0xFCEC80) && c(465, 382, 0xAEAE7F)){
		click(490, 348)
		Sleep 100
		escape()
		Return
	}
}

handleDailyChest(){
	if(clickWhen(614, 347, 0xB53547, 0, 0))
		Return ;Claim gold chest
	if(clickWhen(612, 449, 0xBF3D50, 0, 0)) 
		Return ;Claim free chest

	if(c(1144, 673, 0x653B2E)){	;In daily quests
		clickWhen(639, 343, 0xCF6BDB, 1384, 359) ;Share game
		if(clickWhen(1452, 265, 0xA4805B, 1452, 265))
			Return ;Claim daily quests
		;Claim daily reward coin 1
		clickWhen(719, 728, 0xB8384A, 0, 0)
		;Claim daily reward coin 2
		clickWhen(832, 729, 0xB23345, 0, 0)
		;Claim daily reward coin 3
		clickWhen(947, 729, 0xB03244, 0, 0)
		;Claim daily reward coin 4
		clickWhen(1060, 729, 0xB43547, 0, 0)
		;Claim weekly blue treasure
		clickWhen(1248, 745, 0xBB3A4C, 0, 0)
		;CLaim weekly purple treasure
		clickWhen(1421, 745, 0xBB3A4C, 0, 0)
		Return
	}
	;Claim all daily reward chest
	if(c(1465, 521, 0xD0C0A7) && c(1311, 314, 0xAE865E))
		click(1356, 318)

	;Is in celestial page
	if(c(1259, 621, 0xBD42D3)){
		;Claim celestial reward 1
		clickWhen(965, 431, 0xA07D5A, 0, 0)
		;Claim celestial reward 2
		clickWhen(966, 538, 0xA07D5A, 0, 0)
		;Claim celestial reward 3
		clickWhen(966, 664, 0xA6815C, 0, 0)

		;Claim celestial reward 4
		clickWhen(965, 750, 0xA07D5A, 0, 0)
		
		Return
	}
	;Claim celestial reward
	if(c(686, 340, 0x7B7E72)&&c(1049, 748, 0xA47F5B))
		escape()

	if(c(1475, 453, 0xA94510) && c(1455, 280, 0xFFFAEE)) { ;Share page
		if(!c(1292, 744, 0x285280)) ;Not yet click share button
			click(1280, 795)
		else
			click(1282, 751)
	}
}

handleShop(){
	;In shop
	if(c(557, 261, 0xE7C893) && c(600, 264, 0xF4CC91)){
		;Skip animation preparation
		if(c(1170, 790, 0xDFA31F) && c(1327, 316, 0x161C25)){
			click(1327, 316)
			clickWhen(748, 762, 0xCA4558, 0, 0)
		}
		;In lucky spin
		if c(842, 279, 0x226D96){
			;Skip animation lucky spin
			if c(1302, 781, 0x192742)
				click(1302, 782)
		}
		;Skip animation aurora summon
		if(c(1273, 805, 0xB366FF)){
			clickWhen(588, 801, 0x161831, 0, 0)
			clickWhen(1456, 748, 0xB53648, 0, 0)
			return
		}
		;Skip animation Zodiac summon
		if(c(1346, 745, 0x587CF5) && c(578, 751, 0x081626))
			click(578, 751)
		;Skip animation magic wheel
		if(c(1323, 811, 0x21C3E4) && c(578, 321, 0x0C2237))
			click(579, 318)
	}
}
sendBp(){
	if c(546, 356, 0x44B1ED) && c(988, 269, 0x3DD6FF) {
		if clickWhen(1404, 434, 0x38EE29, 0, 0){
			closeBpDialog()
			return
		} ;Send bp 1
		if clickWhen(1405, 518, 0x42EE37, 0, 0){
			closeBpDialog()
			return
		}  ;Send bp 2
		if clickWhen(1404, 602, 0x38EE29, 0, 0){
			closeBpDialog()
			return
		}  ;Send bp 3
		if clickWhen(1402, 685, 0x33E52D, 0, 0){
			closeBpDialog()
			return
		}  ;Send bp 4
		if clickWhen(1396, 747, 0xB4B68B, 0, 0){
			closeBpDialog()
			return
		}  ;Send bp 5
	}
}
closeBpDialog(){
	pixelWait(961, 680, 0x17385D)
	escape()
	pixelWaitNot(961, 680, 0x17385D)
	sendBp()
}
claimGrandCollectionToken(){
	if(c(1395, 653, 0xB7384A)){
		if(clickWhen(1395, 653, 0xB7384A, 0, 0)){
			waitClick(1031, 716, 0xB89776)
			return true
		}
	}
	return false
}
sendEmpireChevalierMedal(){
	if(c(702, 476, 0xC350AE) && c(751, 521, 0xF0E277)){
		proceedSendMedal()
		return true☺☻
	}
	return false
}

proceedSendMedal(){
	click(1113, 656)
	Sleep 100
	click(1113, 656)
	Sleep 500
	Send {esc}
}

while(true)
	loop()
!p::ExitApp
#Include __Functions.ahk