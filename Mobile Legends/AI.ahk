global sensitivity:=4
global brawlMatch:=false
global memberDeleted:=false
global memberSorted:=false
global withSquadInvite:=false
global withGroupInvite:=true
global withDeleteMember:=true

global withArena:=true
global winRemaining:=4

global withMc:=true
global lineupSelected:=true
global mcPlayRemaining:=20
global minRefresh:=2
global maxRefresh:=2
global round:=0
global maxRound:=20

aiEnabled:=true
attack:=true
watchAds:=false
arenaColor:=0x000000
deadColor:=0x000000
hasEnemy:=false
match:=0
ads:=0
maxAds:=10

y := 1006
xs := []
xs[0] := 692
xs[1] := 783
xs[2] := 883
xy := []
xy[0,0] := 671
xy[0,1] := 575
xy[1,0] := 745
xy[1,1] := 682
xy[2,0] := 699
xy[2,1] := 456
xy[3,0] := 785
xy[3,1] := 589
xy[4,0] := 865
xy[4,1] := 725
xy[5,0] := 778
xy[5,1] := 485
xy[6,0] := 892
xy[6,1] := 648
xy[7,0] := 781
xy[7,1] := 381
xy[8,0] := 883
xy[8,1] := 537
xy[9,0] := 1017
xy[9,1] := 713

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
	if(getDayOfWeek()==1||getDayOfWeek()==2){
	;	withDeleteMember:=false
	;	withGroupInvite:=false
	}
	while(aiEnabled){	
		;Defaults
		;if(clickWhen(, , )) continue
		Sleep 1000

		;Close fake serial number idm
		if(clickWhen(707, 440, 0xFCE100, 1202, 625))
			continue
		;Close idm registration
		if(clickWhen(702, 341, 0x4B82E5,1149, 675))
			continue

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
		
		;[Done] Get gold chest
		if(clickWhen(613, 345, 0xD74D61, 581, 373)) {
			Sleep 1000
			continue
		}
		;[Done] Get free chest
		if(clickWhen(612, 450, 0xB8384A, 580, 477)) {
			Sleep 1000
			continue
		}
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

		;[Done] Close dialog invite 
		If (isColor(1142,592, 0xA07D5A) || isColor(837, 688, 0x0D2136) || isColor(835, 676, 0x0B1B2C) || isColor(839, 679, 0x0C1E31)){
			click(839, 683)
			click(841, 610)
			Sleep 300
			click(772, 618)
			click(955, 675)
			Continue
		}

		;------------------------------------Arena match
		if(withArena){
			;Start arena match
			if(isColor(873, 655, 0xD9AE49)){
				;Click victory reward
				click(1416, 361)
				Sleep 500
				click(1235, 364)
				Sleep 1500
				
				if(winRemaining>0){
					click(967, 669)			
				}
				;Click back
				else{
					click(457, 259)
				}
				continue
			}

			;Close reward info
			if(isColor(755, 363, 0x1F3C59) && isColor(1237, 361, 0xC9B288)){
				click(1238, 360)
				continue
			}

			;Recieve reward
			if(isColor(1013, 753, 0xBC8E61)){
				click(1013, 753)
				continue
			}

			;Obtain new card
			if(isColor(1049, 771, 0xB98F62)){
				click(962, 755)
				continue
			}

			;Close match
			if(isColor(1462, 799, 0xADD9FA)){
				;Win arena			
				if(!isColor(979, 535, 0x767A7A)){
					winRemaining:=winRemaining-1
				}
				click(967, 795)
				continue
			}

			;In match
			if(isColor(952, 207, 0x4D8777)){
				if(targetIndex > 6){
					heroIndex := rand(0, 9)
					drag(1050, y, xy[heroIndex][0],  xy[heroIndex][1])
					Sleep 100
					heroIndex := rand(0, 9)
					drag(1145, y, xy[heroIndex][0],  xy[heroIndex][1])
					Sleep 100
					heroIndex := rand(0, 9)
					drag(1238, y, xy[heroIndex][0],  xy[heroIndex][1])
					Sleep 100
				}	
				targetIndex := rand(0, 9)
				drag(xs[0], y, xy[targetIndex][0],  xy[targetIndex][1])
				Sleep 100
				targetIndex := rand(0, 9)
				drag(xs[1], y, xy[targetIndex][0],  xy[targetIndex][1])
				Sleep 100
				targetIndex := rand(0, 9)
				drag(xs[2], y, xy[targetIndex][0],  xy[targetIndex][1])
				Sleep 100
				continue
			}
		}

		;-------------------------------------

		if(withMc){
			;MC Start game
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
				click(1236, 410)
				click(673, 411)
				click(759, 323)
				click(890, 323)
				click(1024, 337)
				click(1167, 335)
			}

			;Recommend lineup showup
			if(isColor(1461, 292, 0x6FB8EC)){
				click(716, 532)
				Sleep 500
				click(1459, 294)
				Sleep 500
				lineupSelected:=true
				delete3Heroes()
				continue
			}
		
			;In inventory
			if(isColor(1436, 1038, 0x1F598D)||isColor(1445, 1027, 0x83F5FD)){
				;Recommend lineup first time
				if(!lineupSelected){
					; openInventory()			
					recommendLineup()
					delete3Heroes()
					lineupSelected:=true
				}
				buyOrRefresh()
			}

			;Pick item from monster / include item
			if(isColor(468, 199, 0xFC0E28)){
				if(isColor(510, 588, 0x275079)){
					assignItems()
				}
				else{
					click(520, 79)
					click(520, 141)
					click(517, 207)
					click(449, 218)
				}
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
			if(isColor(452, 1036, 0x4A9AC4)){
				click(486, 1012)
				continue
			}
			
			;Close MC Competition
			if(isColor(1195, 657, 0xFFFF5C)){
				click(1412, 364)
			}
		}
		;--------------------------------------

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

		;Back to lobby
		if(isColor(999, 729, 0x4873D2) && isColor(922, 241, 0x74A8B4)){
			click(999, 729)
			continue
		}

		;If on main menu and not finding match
		if(isColor(1397, 247, 0xA7B9D8) && isColor(922, 241, 0x74A8B4)) {
			if(withMc && mcPlayRemaining>0){
				click(973, 719)	
				Sleep 1000
				click(1281, 371)
			}
			else if(withDeleteMember && !memberDeleted){
				click(1319, 401)
			}else
				click(959, 550)
			continue
		}

		;Click group setting & type something
		if(clickWhen(619, 307, 0xAEC2DC, -1, -1)){
			click(620, 315)
			continue
		}

		;If is in group members
		if(isColor(458, 277, 0xDDA601)){
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
						followAndRemoveMember()
						followAndRemoveMember()
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
		if(clickWhen(1323, 325, 0xD8962E, -1, -1)){
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
		if(clickWhen(1373, 290, 0x74819C, 0, 0)||clickWhen(1374, 300, 0x677791, 0, 0))
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
		;[Done] Close dialog event
		if(clickWhen(1425, 322, 0x83D3E4, 0, 0))
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
			;Prevent start game when not AI
			;if(!isColor(738, 261, 0x35CC0B)&&!isColor(739, 261, 0x17E400)){
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
					click(1065, 723)
					sleep 900
					click(1065, 723)
					sleep 900
					;Click Player Mastery
					click(919, 691)
					Sleep 500
					click(545, 448)
					click(545, 448)
					click(545, 448)
					sleep 10000
				}
				click(858, 746)
				memberDeleted:=false
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
		;Back from National Arena Contest
		if(clickWhen(988, 809, 0x56422E, 480, 266))
			continue
		;Back from starlight
		if(clickWhen(851, 642, 0xEA4CF8, 480, 266))
			continue
		;Back from arcade
		if(clickWhen(575, 791, 0xFE5DEA, 480, 266))
			continue

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
		;Back from live stream
		if(clickWhen(1377, 256, 0x3B549E, 478, 263))
			continue
		if(isColor(542, 267, 0xB09570) && isColor(459, 255, 0xFFE0AD)){
			click(478, 263)
			continue
		}
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
		;Close blazing west event
		if(isColor(1400, 323, 0xD6C69D)){
			Send {Esc}
			continue
		}
		;Back from inventory
		if(isColor(1072, 241, 0x5FBCE4)){
			Send {Esc}		
			continue
		}
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
		;Close super lucky star dialog
		if(isColor(871, 763, 0x8EB754)){
			Send {Esc}
			continue
		}
	}
Return
#IfWinActive
assignItems(){
;Assign item base
	click(509, 91)
	Sleep 500
	click(697, 315)
	Sleep 500
	;Assign item 1
	click(594, 89)
	Sleep 500
	click(698, 161)
	Sleep 500
	;Assign item 2
	click(592, 144)
	Sleep 500
	click(698, 236)
	Sleep 500
	;Assign item 3
	click(598, 213)
	Sleep 500
	click(696, 87)
	Sleep 500

	click(450, 81)
}
buyOrRefresh(){
	Sleep 1500
	round:=round+1
	Loop %minRefresh% {
		;Always refresh if round > 11 || Refresh when no hero bought and has deposit 2
		if(round>11 || (!isHeroBought() && isColor(1431, 17, 0xF4ECAA)))
			clickRefresh()
	}
	isHeroBought()

	;Refresh more by deposit 4
	refresh:=0
	if(isColor(1464, 16, 0xF8ECA9))
		refresh:=2
	Loop %refresh% {
		isHeroBought()
		clickRefresh()
	}
	isHeroBought()
	
	;Close inventory
	click(1436, 1007)
	Sleep 500
	click(456, 654)
}
clickRefresh(){
	click(1438, 523)
	Sleep 600
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
	click(1386, 628)
	Sleep 1000

	;Close lineup
	click(1464, 295)
	Sleep 500

	round:=0
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
	openInventory()
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

followAndRemoveMember(){
	;followMembers()
	removeMember(1441, 745)
	removeMember(1444, 670)
	removeMember(1445, 616)
	removeMember(1444, 554)
	removeMember(1445, 489)
	;removeMember(1443, 430)
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