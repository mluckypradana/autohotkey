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
	if c(1274, 346, 0x457FC9) {
		click(1284, 350)
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
	;Resume skipped video
	if (c(1207, 663, 0x3E82F7) && c(1242, 663, 0xFFFFFF) && c(1518, 670, 0x000000))
	|| (c(1130, 631, 0x3E82F7) && c(1156, 634, 0xFFFFFF) && c(404, 645, 0x000000))
	|| (c(592, 434, 0xF9AA01) && c(1248, 683, 0x3F82F7)) {
		escape()
		tooltip("Resume skipped video")
		Sleep 10000
		return true
	}

	;Close left ad
	if (c(459, 40, 0x4D4D50) && c(472, 41, 0xFFFDFF)) {
		click(459, 38)
		return true
	}

	;Close ad
	if (c(1445, 54, 0xFFFFFF) && c(1428, 51, 0x3C4043) && c(424, 1074, 0x000000)) ;Video ad
	|| (c(439, 1044, 0x202124) && c(451, 479, 0x202124) && c(402, 550, 0x000000)) ;Playstore black background
	|| (c(431, 1069, 0x29BBD5) && c(1459, 40, 0x2F2D2B)) ;With info at bottom left
	|| (c(447, 1046, 0xE6E6E6) && c(1460, 39, 0xFEFEFE) && c(1469, 38, 0x181818)) ;Protected at bottom left (small)
	|| (c(461, 1042, 0xCFCFCF) && c(446, 1063, 0xFAFAFA)) ;Protected at bottom left white background
	|| (c(1365, 959, 0x888888) && c(1340, 1015, 0x4B8BA2)) ;Playstore white background
	|| (hasProtectedIcon() && c(1392, 32, 0xFEFEFE) && c(1392, 22, 0x080808)) ;Protected white button
	|| (c(446, 15, 0xE6E6E6) && c(689, 839, 0x68983F)) ;Protected bottom left with rating
	|| (hasInfoIcon() && c(926, 1005, 0x0C7FFF)) ;Info bottom left, blue open button
	|| (hasInfoIcon() && c(976, 1017, 0x097DFF)) ;Info bottom left, blue open button
	|| (hasInfoIcon() && c(1473, 41, 0xD7D5D8)) ;Info bottom left, white circle solid
	|| (hasInfoIcon() && c(1459, 40, 0x4D4D50)) ;Info top right, white circle solid
	{
		if isPlaystore()
			escape()
		else
			clickClose()
		return true
	}
	return false
}
isPlaystore(){
	return c(444, 312, 0x202124) && c(450, 888, 0x202124) && c(403, 215, 0x000000)
}
hasInfoIcon(){
	return c(438, 21, 0x00AECD)
	|| c(440, 1066, 0x85D8E7) ;Bottom left
	|| c(432, 1068, 0x43C2DA)
	|| c(1487, 14, 0x1EB7D3) ;Top right
}
hasProtectedIcon(){
	return c(512, 19, 0xE6E6E6) ;Top left gray
	|| c(457, 19, 0xE6E6E6) ;Top left gray
	|| c(478, 1003, 0xFFFFFF) ;Bototm left white
}
clickClose(){
	if c(459, 40, 0x4C4C4F)
		click(459, 40)
	else
		click(1453, 23)
}
handleInbox(){
	if c(1280, 333, 0xE9E296) && c(1433, 777, 0x9F876B)
		click(1433, 777) ;Claim all BP in inbox
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
	if clickWhen(1277, 261, 0xB9394B, 0, 0) {
		waitClick(1336, 782, 0x4656BD)
		return true
	}
	return false
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
handleShop(){
	;In shop
	if c(1487, 264, 0x00FF00) {
		;In lucky spin / draw
		if c(743, 257, 0x74D7E4) {
			;Skip animation lucky spin
			if !c(1305, 778, 0xA0E6FE){
				click(1305, 778)
				if clickWhen(1202, 553, 0xF5EF90, 0, 0){ ;Draw ticket
					waitClick(868, 575, 0x273E57)
					waitClick(1033, 643, 0x9B8469)
				}
			}
			return
		}
		;Skip animation aurora summon
		if c(1277, 795, 0xC169FF) {
			if clickWhen(614, 801, 0x141A32, 0, 0)
				click(1428, 779)
			return
		}
		;Skip animation Zodiac summon
		if(c(1346, 745, 0x587CF5) && c(578, 751, 0x081626))
			click(578, 751)
		;Skip animation magic wheel
		if(c(1323, 811, 0x21C3E4) && c(578, 321, 0x0C2237))
			click(579, 318)
		;Skip animation preparation
		if c(647, 334, 0xE1E8EE) {
			if !c(1328, 312, 0x9BDEF8) 
				click(1328, 312)
			;Click free draw preparation
			clickWhen(749, 764, 0xB53648, 0, 0)
			return true
		}
	}
}
sendBp(){
	if c(812, 324, 0x60B2D6) {
		if clickWhen(1404, 434, 0x38EE29, 0, 0){
			closeBpDialog()
			return
		} ;Send bp 1
		if clickWhen(1434, 380, 0xE6CD9E, 0, 0){
			closeBpDialog()
			return
		}  ;Send bp 2
		if clickWhen(1434, 475, 0xF0D9AD, 0, 0){
			closeBpDialog()
			return
		}  ;Send bp 3
		if clickWhen(1435, 569, 0xE9CFA7, 0, 0){
			closeBpDialog()
			return
		}  ;Send bp 4
		if clickWhen(1435, 663, 0xECD2A9, 0, 0){
			closeBpDialog()
			return
		}  ;Send bp 5
	}
}
closeBpDialog(){
	pixelWait(736, 681, 0x4C6793)
	escape()
	pixelWaitNot(690, 684, 0x37587D)
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
		return true
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