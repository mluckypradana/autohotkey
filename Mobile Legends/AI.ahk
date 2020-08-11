global sensitivity:=4
global brawlMatch:=false
global memberDeleted:=false
global memberSorted:=false
global withSquadInvite:=false
global withGroupInvite:=true
global withDeleteMember:=true
global activeGroupMember:=0
global maxActiveGroupMember:=5
aiEnabled:=true
attack:=true
watchAds:=false
arenaColor:=0x000000
deadColor:=0x000000
hasEnemy:=false
match:=0
ads:=0
maxAds:=10

#Include __Basic.ahk

!+s::Suspend

!,::
	aiEnabled:=false
	SoundBeep 350, 100
Return

;Auto accept + Auto attack
!.::
	aiEnabled:=true
	SoundBeep 350, 100	
	while(aiEnabled){	

		;Defaults
		;if(clickWhen(, , )) continue
		Sleep 1000

		;Close idm 
		if(clickWhen(789, 534, 0xFCE100, 1149, 477)) 
			continue	
		;Close idm 
		if(clickWhen(791, 544, 0xFCE100, 1146, 485)) 
			continue
		;Close idm
		if(clickWhen(832, 590, 0xFCE100, 1193, 528))
			continue
		;Close idm
		if(clickWhen(767, 616, 0xFCE100, 1257, 691))
			continue

		;Open bluestacks mobile legends in isladn
		if(clickWhen(294, 184, 0x3F51B5, 0, 0)){
			Sleep 3000
			continue		
		}
		;Open mobile legends in island
		if(clickWhen(1150, 134, 0x3F51B5, 1364, 297)){
			Sleep 1000
			click(1380, 305)
			Sleep 3000
			Send {F11}
			continue
		}

		;[Done] Get gold chest
		if(clickWhen(618, 345, 0xFF3E4D, 581, 373)) 
			continue
		;[Done] Get free chest
		if(clickWhen(615, 449, 0xFF354E, 580, 477)) 
			continue
		;Get confim chest
		if(clickWhen(682, 531, 0x12842f, 0, 0)) 
			continue
		;Confirm info chest
		if(clickWhen(960, 713, 0xD99F69, 0, 0)) 
			continue
		;Draft pick pager
		if(clickWhen(1427, 545, 0x8CA6CE, 0, 0)) 
			continue
		;Close webview
		if(clickWhen(1349, 814, 0xA9A9A9, 0, 0))
			continue

		;[Done]
		while(aiEnabled && isAllowMove()){
			;Close idm
			if(clickWhen(767, 616, 0xFCE100, 1257, 691))
				continue
				
			;Surender
			if(clickWhen(526, 281, 0xDCA26A, 0, 0))
				continue

			;[Done] Retreat
			if(hasEnemyFromBehind()){ ;From behind
				;MouseMove 500, 500
				retreat()
				Continue
			}

			;[Done] Move player
			Send {Up down}{Right down}
			while(isAllowMove()){
				if(attackWhenHasEnemy())
					break
				Send {Up down}{Right down}
				Send g ;{space}
				Send 45321
				Send g ;{space}
				Send {Right up}
				Sleep 210
				if(attackWhenHasEnemy())
					break
				Send g ;{space}
				Send {Right down}
				Loop, 7{
					Sleep 100
					Send g ;{space}
				}
				if(attackWhenHasEnemy())
					break
				if(stuckAtRight()){
					Send {Up down}{Right up}
					Sleep 3000
					Send {Up up}{Right up}
				}
			}
			Send {Up up}{Right up}
			;MouseMove 100, 500
		}

		;If on main menu and not finding match
		if(clickWhen(1397, 247, 0xA7B9D8, -1, -1)) {
			if(withDeleteMember && !memberDeleted){
				click(1318, 492)
			}else
				click(959, 550)
			continue
		}

		;Click setting
		if(clickWhen(619, 307, 0xAEC2DC, 620, 315))
			continue

		;If is in group members
		if(isColor(455, 266, 0xE03B01)){
				if(memberDeleted){
					click(1443, 265)
					Sleep 500
					click(1422, 267)
					memberSorted:=false
					continue
				}
				if(!isFullMember()){
					memberDeleted:=true
					continue
				}
				if(memberSorted){
					;Delete member
					if(!memberDeleted && !isColor(1344, 492, 0x529457)){
						followAndRemoveMember()
						memberDeleted:=true
						continue
					}
				}
				else{				
					;Sort member
					followMembers()
					click(1334, 319)
					memberSorted:=true
					continue
				}
		}

		if(clickWhen(853, 699, 0x8D774F, 959,550)) 
			continue
		;If brawlMatch, pick brawl match in battle type
		

		;[Done] If in battle type pick AI
		if(clickWhen(1323, 325, 0xD8962E, -1, -1)){
			if(brawlMatch)
				click(559, 693)
			else
				click(839, 697)
			Sleep 500
			click(973, 726)
			
			continue
		}

		;[Done] If in vs AI mode, click(brawl
		if(clickWhen(644, 342, 0x96E0E9, 824, 504)){
			Sleep 200
			click(824, 504)
			Continue
		}

		;[Done] In picker
		PixelGetColor, color, 1491, 811, RGB
		PixelGetColor, equipmentColor, 1318, 680, RGB
		If (equal(color,0x424242)<4 && equal(equipmentColor,0x81E1EB)>4){
			;Expand picker
			click(1275, 518)
			Sleep 200
			;Pick Roger
			click(1180, 249)
			Sleep 200
			click(1005, 440)
			Sleep 200
			;Pick Okay
			click(1394, 809)
			Continue
		}	

		;-------------------------------------------------- Ads
		if(watchAds && ads<maxAds){
			;Resume Video
			PixelGetColor, color, 1179, 709, RGB
			If (equal(color,0x3F81F7)<4){
				click(1179, 709)
				ads:=ads-1
				Sleep 7000
				Continue
			}

			;If allowed to click(close video (If no time remaining and close button is exists)
			PixelGetColor, color, 1365,6, RGB
			PixelGetColor, closeColor, 1460,39, RGB
			If (equal(color,0x010001)>4 && equal(closeColor, 0x4C4C4F)<4){
				click(1460,39)
				ads:=ads+1
				Continue
			}


			;(Another) If allowed to click(close video
			PixelGetColor, color, 993,578, RGB
			PixelGetColor, closeColor, 1463,55, RGB
			If (equal(color,0x3C4043)>4 && equal(closeColor, 0x3C4043)<4){
				click(1460,39)
				ads:=ads+1
				Continue
			}
			;

			;(Another) If allowed to click(close video
			PixelGetColor, infoColor, 440, 1059 , RGB
			If (equal(infoColor, 0x00AECD)<4){
				click(1460,39)
				ads:=ads+1
				Continue
			}

			;Receive reward
			if(clickWhen(1030,730, 0xAB845D,1030,730))
				Continue

			;View video
			if(clickWhen(1030,730, 0xAB845D,1030,730))
			PixelGetColor, color, 1452, 286, RGB
			If (equal(color,0x84CFFF)<4){
				click(1452,286)
				Continue
			}
		}
		;----------------------------------------------------


		
		;If not connected
		if(clickWhen(1093, 655, 0xAF855D, 1097, 671))
			continue

		;[Done] Close dialog invite 
		PixelGetColor, color, 1142,592, RGB
		PixelGetColor, color2, 837, 688, RGB
		If (equal(color,0xA07D5A)<4 || equal(color2, 0x0D2136)<4){
			takeScreenshot()
			click(839, 683)
			click(841, 610)
			Sleep 300
			click(768, 549)
			click(955, 675)
			Continue
		}		
		;Close reason dialog invite
		if(clickWhen(762, 557, 0x3EDAFF, 960, 679))
			continue
		;Close dialog event fullscreen
		if(clickWhen(1415, 306, 0x7BC8FE, 0, 0))
			continue
		;Close dialog purchase event
		if(clickWhen(1352, 338, 0x7174B4, 0, 0))
			continue
		;[Done] Close dialog event fullscreen
		if(clickWhen(1415, 306, 0x7CCBFF, 1415, 306))
			continue
		;Close dialog 7-day daily login
		if(clickWhen(1373, 290, 0x74819C, 0, 0))
			continue
		;Close dialog daily event
		if(clickWhen(1376, 329, 0x7DCDFF, 1376, 329)) 
			continue
		;[Done] Close dialog event
		if(clickWhen(1151, 252, 0xF3DF7A, 1376, 327)) 
			continue
		;[Done] Close dialog event
		if(clickWhen(962, 745, 0xDCA26A, 962, 745)) 
			continue

		;Close dialog webview
		PixelGetColor, color, 990, 601, RGB
		If (equal(color,0xe4e4e4)<4){
			click(990, 601)
			Continue
		}
		;Close dialog popup
		PixelGetColor, color, 1042, 198, RGB
		If (equal(color,0xb0b6da)<4){
			click(1042, 198)
			Continue
		}
		;Close dialog chat
		PixelGetColor, color, 1048, 167, RGB
		If (equal(color,0xafb5d8)<4){
			click(1048, 167)
			Continue
		}
		;Close small dialog chat
		if(clickWhen(889, 583, 0x99AAD3, 1216, 393))
			continue

		;CLose dialog buy hero
		PixelGetColor, color, 977, 212, RGB
		If (equal(color,0xafb5d9)<4){
			click(977, 212)
			Continue
		}
		

		;[Done] Start game
		if(clickWhen(760, 729, 0xE7B075, -1, -1)){
			if(withGroupInvite && activeGroupMember < maxActiveGroupMember){
				click(1061, 812)
				sleep 500
				if(withSquadInvite){
					click(1063, 685)
					sleep 200
				}
				click(1065, 723)
				sleep 500
				;Click no timeouts
				click(927, 720)
				Sleep 500
				click(545, 448)
				click(545, 448)
				click(545, 448)
				sleep 10000
			}
			if(!isColor(677, 427, 0x074479))
				activeGroupMember:=activeGroupMember+1
			click(858, 746)
		}

		;[Done] Accept game
		PixelGetColor, color, 846, 770, RGB
		If (equal(color,0xBE9D64)<4){
			click(964, 744)
			Continue
		}

		;[Done] Accept Game Ramadhan
		PixelGetColor, color, 801, 432, RGB
		If (equal(color,0x037371)<4){
			click(964, 744)
			Continue
		}

		;[Done]
		; 
		;Match up delay
		
		PixelGetColor, color, 1043, 651, RGB
		If (equal(color,0xDCA16A)<4){
			click(1043, 651)
			Continue
		}

		;[Done] In brawl picker
		PixelGetColor, color, 1094, 784, RGB
		If (equal(color,0xA5805B)<4){
			click(877, 494)
			click(1022, 784)
			Continue
		}

		;AFK when start game
		if(clickWhen(909, 646, 0xB2885F, 909, 646))
			continue
		
		;AFK
		PixelGetColor, color, 959, 656 , RGB
		If (equal(color,0xB0865E)<4){
			click(954, 670)
			Continue
		}

		;AFK After match
		PixelGetColor, color, 682, 502, RGB
		If (equal(color,0x13852e)<4){
			click(682, 502)
			Continue
		}

		;[Done] Victory prompt
		PixelGetColor, color, 950, 552, RGB
		If (equal(color,0xF6CE72)<12){
			click(965, 801)
			Continue
		}

		;[Done] Continue summary graph
		PixelGetColor, color, 451, 803 , RGB
		If (equal(color,0xAAC3E1)<4){
			click(1359, 802)
			Continue
		}

		;[Done] Continue Achievement
		PixelGetColor, color, 1479, 732, RGB
		If (equal(color,0xA07D5A)<4){
			click(1390, 746)
			Continue
		}

		;[Done] Achievement popup emblem
		PixelGetColor, color, 1379, 805, RGB
		If (equal(color,0xDDA26A)<4){
			click(1379, 805)
			Continue
		}

		;[Done] Continue Achievement 2
		PixelGetColor, color, 1427, 755 , RGB
		If (equal(color,0xAB845D)<4){
			click(1427, 755)
			Continue
		}

		;Continue Achievement 3
		PixelGetColor, color, 990, 540, RGB
		If (equal(color,0x12872f)<4){
			click(990, 540)
			Continue
		}
		;Continue Achievement 4
		if(clickWhen(442, 653, 0xB91F1B, 1400, 745))
			continue

		;Credit celestial level
		PixelGetColor, color, 959, 814, RGB
		If (equal(color,0xDAA069)<4){
			click(959, 814)
			Continue
		}

		;Credit score prompt
		PixelGetColor, color, 757, 490 , RGB
		If (equal(color,0x46AF3D)<4){
			click(953, 741)
			Continue
		}

		;Continue bp collected
		PixelGetColor, color, 790, 584, RGB
		If (equal(color,0x138830)<4){
			click(790, 584)
			Sleep 5000
			Continue
		}
		
		;

		;Continue bp collected 2
		PixelGetColor, color, 1360, 819 , RGB
		If (equal(color,0xDAA069)<4){
			click(1360, 819)
			Sleep 5000
			Continue
		}

		;Continue statistic
		If (clickWhen(1416, 282, 0xA01F36, -1, -1)){
			match:=match+1
			memberDeleted:=false
			follow()
			commendEveryone()
			Sleep 500
			click(1406, 804)
			Sleep 5000
			Continue
		}

		;Commend all
		if(clickWhen(815, 376, 0x6F7F94, -1, -1)){
			follow()
			commendEveryone()
			Continue
		}

		;Continue finish match rank
		PixelGetColor, color, 451, 800 , RGB
		If (equal(color,0xB8D1EA)<4){
			click(1361, 803)
			Continue
		}

		;Rate
		PixelGetColor, color, 967, 421, RGB
		If (equal(color,0xF5DCED)<4){
			click(1100, 443)
			Continue
		}

		;Back button
		PixelGetColor, color, 1044, 587, RGB
		If (color==0x34c947||color==0x34c846){
			click(1044, 587)
			Continue
		}

		;Close MCL
		PixelGetColor, color, 1416, 353, RGB
		If (equal(color,0x663D87)<4){
			click(1416, 353)
			Continue
		}
		;Close recharge season page
		if(clickWhen(1336, 292, 0x6A7198, 0, 0))
			continue

		;[Done] recharge page
		PixelGetColor, color, 1386, 350, RGB
		If (equal(color,0x7CCCFF)<4){
			click(1386, 350)
			Continue
		}

		;[Done] Close 515 Party Popup
		PixelGetColor, color, 936, 794, RGB
		If (equal(color,0xFFA931)<4){
			click(1248, 341)
			Continue
		}
		
		;[Done] MCL Streaming close
		PixelGetColor, color, 1331, 258, RGB
		If (equal(color,0xAFB7D8)<4){
			click(1331, 258)
			Continue
		}
		;Exit game guardian
		if(clickWhen(1299, 396, 0x424242, 0, 0))
			continue
		;Close recharge diamond
		if(clickWhen(1385, 352, 0x7DCEFF, 0, 0))
			continue
		;Close rules
		if(clickWhen(1073, 784, 0xDCAD77, 0, 0))
			continue
		;Close invitation reason
		if(clickWhen(984, 682, 0xB2C3D6, 0, 0))
			continue
		;Close eudora dialog
		if(clickWhen(1276, 364, 0x97DEE5, 0, 0))
			continue
		;Close live section
		if(clickWhen(1466, 255, 0x3C7FA6, 477, 262))
			continue
		;Close credit score decreasing dialog
		if(clickWhen(849, 606, 0xBF2417, 964, 739))
			continue
		;Back from arcade
		if(clickWhen(1344, 497, 0xA07D5A, 475, 261))
			continue
		;Back from profile
		if(clickWhen(727, 317, 0xE31D35, 478, 263))
			continue
		;Close Conquest of Dawn dialog
		if(clickWhen(1478, 377, 0x7CCDFF, 0, 0))
			continue
		;Close watch live stream dialog
		if(clickWhen(626, 638, 0xA07D5A, 1344, 324))
			continue
		;Close nostalgia dialog
		if(clickWhen(1387, 318, 0x7DCEFF, 0, 0))
			continue
		;Close celestial level up
		if(clickWhen(961, 375, 0xE035E9, 964, 800))
			continue
		;Close permanent skin dialog
		if(clickWhen(1399, 314, 0x876947, 0, 0))
			continue
		;Close tutorial hero mastery
		if(clickWhen(953, 727, 0xEBECEC, 661, 819)){
			restartMobileLegends()
			continue
		}
		;Close chat dialog
		if(clickWhen(537, 804, 0x6DBFF1, 1422, 268))
			continue
		;Close intro dialog
		if(clickWhen(1039, 730, 0xAC8A5D, 0, 0))
			continue
		;Close update finished dialog
		if(clickWhen(1041, 636, 0x998160, 0, 0))
			continue
		;Close dialog gmail login
		if(clickWhen(554, 703, 0x808080, 958, 956))
			continue
		;Back from inventory
		if(clickWhen(1072, 241, 0x5FBCE4, 475, 270))
			continue
		;Close not responding nox
		if(clickWhen(483, 856, 0x282828, -1, -1)){
			if(clickWhen(603, 792, 0xEAEAEA, 0, 0))	
				continue
		}
		;Close event dialog project
		if(clickWhen(1470, 316, 0x7CCAFF, 0, 0))
			continue
		;Close mayhem mode dialog
		if(clickWhen(1470, 306, 0x7CCAFF, 0, 0))
			continue
	}
Return

followAndRemoveMember(){
	followMembers()
	removeMember(1441, 745)
	removeMember(1444, 670)
	removeMember(1445, 616)
	removeMember(1444, 554)
	removeMember(1445, 489)
	removeMember(1443, 430)
}

followMembers(){
	;1
	if(isColor(628, 446, 0xE15792) &&(isColor(1037, 420, 0xBB9A5F)||isColor(1024, 421, 0x688074)))
		followMember(406)
	;2
	if(isColor(628, 509, 0xDB558E) &&(isColor(1035, 483, 0xC4A665)||isColor(1024, 485, 0x738F7D)))
		followMember(470)
	;3 legend
	if(isColor(628, 572, 0xDA538C) &&(isColor(1034, 547, 0xCAA853)||isColor(1023, 545, 0x5A7064)))
		followMember(537)
	;4
	if(isColor(627, 634, 0xDF5690) &&(isColor(1035, 610, 0xE4CA6D)||isColor(1024, 613, 0x8EAF94)))
		followMember(597)
	;5
	if(isColor(628, 698, 0xD64F88) &&(isColor(1034, 673, 0xF0DD9C)||isColor(1024, 673, 0x72927E)))
		followMember(660)
	;6
	if(isColor(627, 760, 0xE25591) &&(isColor(1032, 734, 0xD2C589)||isColor(1023, 737, 0x798C78)))
		followMember(720)

	Sleep 200
}
followMember(y){
	click(611, y)
	sleep 800
	click(949, y)
	sleep 800
}

removeMember(cx, cy){
	click(cx, cy)
	Sleep 500
	click(1101, 673)
	Sleep 1000
}

attackWhenHasEnemy(){
	if(hasEnemy()){	
		attack()
		halfRetreat()
 		retreat()
		return true	
	}
	else
		return false
}

stuckAtRight(){
	PixelGetColor, color, 1222, 553, RGB
	return (equal(color, 0x060604)<4)
}

restartMobileLegends(){
	Send {F11}
			Sleep 1000
			click(1067, 15)
			Sleep 2000
			click(1295, 300)
			Sleep 1000
			click(1295, 300)
			Sleep 1000
			Send {F11}
}

!^d::
	followMembers()
Return

halfRetreat(){
	MouseGetPos x, y
	MouseMove 640, 948
	Send {c down}
	Sleep 250
	Send {c up}
	MouseMove x, y
;	Send {Up up}{Right up}
;	Send {Down down}{Left down}
;	Sleep 950
;	Send {Down down}{Left up}
;	Sleep 100
;	Send {Down up}{Left up}
}

retreat(){
	Send {Up up}{Right up}
	Send {Down down}{Left down}
	Sleep 1900
	Send {Down down}{Left up}
	Sleep 200
	Send {Down up}{Left up}
}

isNotDead(){
	isNotDead := true
	PixelGetColor, color, 642, 56, RGB
	If (color==0xe7e6e6)
		isNotDead:= false
}

verifyHealthBar(x, y){
	dY := y + 2
	PixelGetColor, color, %x%, %dY%
	dX := x + 5		
	PixelGetColor, sideColor, %dX%, %dY%
	isHealthBar := equal(sideColor,color)<4
	xValid := x<931 || x>974
	yValid := y<529 || y>589
	mouseMove x, y
	return (xValid || yValid) ;&& isHealthBar
}

hasEnemy(){
	hasEnemy := false
	enemyColor := 0x3745ef
	turretColor := 0x3640f4

	;First lower player
	PixelSearch, Px, Py, 508, 469, 1060, 970, %enemyColor%, %sensitivity%, Fast
	If !ErrorLevel{ 
		hasEnemy := verifyHealthBar(Px, Py)
	}
	if(!hasEnemy){
		;Second, around player
		PixelSearch, Px, Py, 603, 303, 1227, 836, %enemyColor%, %sensitivity%, Fast
		If !ErrorLevel{ 
			hasEnemy := verifyHealthBar(Px, Py)
		}	
	}
	;if(!hasEnemy){
	;	;Third, front of player
	;	PixelSearch, Px, Py, 718, 194, 1292, 749, %enemyColor%, %sensitivity%, Fast
	;	If !ErrorLevel{ 
	;		hasEnemy := verifyHealthBar(Px, Py)
	;	}	
	;}

	return hasEnemy
}
hasEnemyFromBehind(){
	hasEnemy := false
	PixelSearch, Px, Py,  557, 1100, 837, 934, 0x664bff, %sensitivity%, Fast
	If !ErrorLevel{ 
		hasEnemy := verifyHealthBar(Px, Py)
	}
	PixelSearch, Px, Py,  557, 1100, 837, 934, 0x2A24D6, %sensitivity%, Fast
	If !ErrorLevel{ 
		hasEnemy := verifyHealthBar(Px, Py)
	}
	return hasEnemy
}
hitByTower(){
	hasEnemy := false
	PixelSearch, Px, Py, 740, 384, 1363, 801, 0x4060A5, 4, Fast
	If !ErrorLevel{ 
		hasEnemy := verifyHealthBar(Px, Py)
	}
	return hasEnemy
}

isLowHealth(){
	PixelGetColor, color, 979, 473, RGB
	return equal(color,0x474747)<4
}

backToBase(){
	Send {Up up}{Right up}{Down up}{Left up}
	Send cc
	Sleep 8500
}


attack(){
	Send {Up up}{Right up}
	Send +{r}
	Sleep, 400
	Loop 2{
		Loop, 1{
			Send s
			Send f
	    	Sleep, 200
		}
		Send vvv
		Loop, 4{
			Send a
			Send f
	    	Sleep, 200
		}
		Loop, 3{
			Send d
			Send f
	    	Sleep, 200
		}
		Send +{r}
	}
}

;[Done]
isAllowMove(){
	;PixelGetColor, deadColor, 969, 48, RGB
	PixelGetColor, batteryColor, 625, 11, RGB
	allowMove :=equal(batteryColor,0x00F900)<4 ;&& deadColor!=0xFE2619
	return allowMove
}

leaveBase(){
	Send {Up up}{Right up}
	Send {Up down}{Right down}
	x := 0
	while(x<5){
		;Move a bit
		Send {Up up}{Right down}
		Sleep 100
		Send {Up down}{Right down}

		Sleep 600
		Send {space}
		x := x+1
	}
	Send {Up up}{Right up}
}

isFullMember(){
	return isColor(1461, 815, 0x7F97C7)
}