global sensitivity:=4
global brawlMatch:=false
global memberDeleted:=false
global memberSorted:=false
global firstGroupManaged:=false
global secondGroupManaged:=false
global withSquadInvite:= false
global withGroupInvite:= false
global withDeleteMember:= false

aiEnabled:= true
attack:=true
watchAds:=false
arenaColor:=0x000000
deadColor:=0x000000
hasEnemy:=false
match:=0
ads:=0
maxAds:=10

#Include _AI - Close Dialogs.ahk
#Include _AI - Arena.ahk
#Include _AI - MC.ahk
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
		;Defaults
		;if(clickWhen(, , )) continue
		Sleep 1000

		;[Done] Close dialog invite 
		If (isColor(1142,592, 0xA07D5A)|| isColor(837, 688, 0x0D2136) || isColor(835, 676, 0x0B1B2C) || isColor(839, 679, 0x0C1E31)){
			click(839, 683)
			click(841, 610)
			Sleep 300
			click(772, 618)
			click(955, 675)
			Continue
		}

		if(isWithArena(withArena))
			continue
		if(isWithMc())
			continue


		;[Done]
		;In match
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

				Send 45321
				Send {Up down}{Right down}
				Send g ;{space}
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

		;Back to lobby
		if(isColor(999, 729, 0x4873D2) && isColor(922, 241, 0x74A8B4)){
			click(999, 729)
			continue
		}

		;If on main menu and not finding match
		if(isColor(925, 245, 0x4EB2DE)) {
			if(withDeleteMember && !secondGroupManaged){
				if(!firstGroupmanaged)
					click(1319, 401)
				else{
					memberDeleted:=false
					click(1317, 492)
				}
			}else
				click(959, 550)
			continue
		}

		;Click group setting & type something
		if(isColor(620, 306, 0xB0C4DD)){
			click(620, 315)
			continue
		}

		;If is in group members
		if(isColor(458, 277, 0xDDA601)||isColor(452, 262, 0xAE360B)){
				if(memberDeleted){
					click(1443, 265)
					Sleep 500
					click(1422, 267)
					memberSorted:=false

					if(!firstGroupManaged)
						firstGroupManaged:=true
					else if(!secondGroupManaged)
						secondGroupManaged:=true
					continue
				}
				if(!isFullMember()){
					memberDeleted:=true
					click(526, 657)
					Sleep 500
					click(513, 557)
					continue
				}
				if(memberSorted){
					;Delete member
					if(!memberDeleted && !isColor(1344, 492, 0x529457)){
						followAndRemoveMember()
						;followAndRemoveMember()
						;followAndRemoveMember()
					}
					memberDeleted:=true
					continue
				
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
		if(isColor(1344, 613, 0xE09E33)){
			if(brawlMatch)
				click(559, 693)
			else
				click(839, 697)
			Sleep 1500
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
		
		;If not connected
		if(clickWhen(1093, 655, 0xAF855D, 1097, 671))
			continue
		;Network connection failed
		if(isColor(896, 397, 0x7A8EB6)&&isColor(1160, 665, 0xAC845D)){
			click(1082, 652)
			continue
		}
		
		;[Done] Start game
		if(clickWhen(760, 729, 0xE7B075, -1, -1)){
			;Prevent start game when not AI
			;if(!isColor(739, 260, 0x17E700)){
			;	click(470, 260)
			;}			
			;else{
				if(withGroupInvite){
					click(1061, 812)
					sleep 500
					if(withSquadInvite){
						click(1063, 685)
						sleep 200
					}
					click(1065, 723)
					sleep 900
					;Click black eldian
					;click(975, 724)
					;Click invite all
					click(976, 763)
					Sleep 500
					click(545, 448)
					click(545, 448)
					click(545, 448)
					sleep 10000
				}
				click(858, 746)
				memberDeleted:=false
				firstGroupManaged:=false
				secondGroupManaged:=false
			;}
		}

		;Recieve Reward
		if(isColor(685, 341, 0x7A7B6C)){
			if(isColor(855, 764, 0xAC845D))
				click(855, 764)
			if(isColor(1225, 760, 0xB2885F))
				click(1225, 760)
			else
				click(1051, 767)
			Continue
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
		if(clickWhen(909, 646, 0xB2885F, 909, 646)){
			continue
		}
		;Violation Notice
		if(clickWhen(1156, 488, 0xED4242, 966, 741))
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
		if(clickWhen(968, 484, 0xDFA774, 0, 0))
			continue
		
		;Defeat prompt
		if(clickWhen(753, 536, 0x661110, 0, 0))
			continue

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
		if(clickWhen(442, 653, 0xB91F1B, 1382, 811))
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

		;Continue bp collected 2
		PixelGetColor, color, 1360, 819 , RGB
		If (equal(color,0xDAA069)<4){
			click(1360, 819)
			Sleep 5000
			Continue
		}

		;Continue statistic
		If (isColor(483, 813, 0x27588A)&&isColor(1161, 380, 0x959096)){
			match:=match+1
			follow()
			commendEveryone()
			Sleep 500
			click(1351, 803)
			Sleep 1000
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

		if(closeDialogs())
			continue
	}
Return

;Spam buy MC enabled
!+,::
	stopSpamBuyMc()
Return
!+.::
	loopSpamBuyMc()
Return
#IfWinActive
stopSpamBuyMc(){
	spamBuyMcEnabled:=false
	SoundBeep 350, 100
}
loopSpamBuyMc(){
	spamBuyMcEnabled:=true
	SoundBeep 350, 100
	while(spamBuyMcEnabled){
		if(!buyHeroesInInventoryIfExists())
			deleteHeroesInSlotIfExists()
	}
}

followAndRemoveMember(){
	followMembers()
	;removeMember(1441, 745)
	;removeMember(1444, 670)
	;removeMember(1445, 616)
	;removeMember(1444, 554)
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
	Sleep 100
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
	isHeroBought()
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
	xValid := x<921 || x>984
	yValid := y<519 || y>599
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
	if(!hasEnemy){
		;Third, front of player
		PixelSearch, Px, Py, 718, 83, 1387, 749, %enemyColor%, %sensitivity%, Fast
		If !ErrorLevel{ 
			hasEnemy := verifyHealthBar(Px, Py)
		}	
	}

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
	return isColor(1460, 818, 0x5B75A2)
}