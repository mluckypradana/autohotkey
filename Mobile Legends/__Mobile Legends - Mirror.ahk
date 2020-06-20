#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
setmousedelay -1
active:=true
attack:=true
watchAds:=false
arenaColor:=0x000000
deadColor:=0x000000
hasEnemy:=false
match:=0
ads:=0
maxAds:=10
global actualScreenX:=1920
global actualScreenY:=1080

!^+s::
	ExitApp
Return

!+s::Suspend

equal( c1, c2 ) ; find the distance between 2 colors
{ ; function by [VxE], return value range = [0, 441.67295593006372]
; that just means that any two colors will have a distance less than 442
   r1 := c1 >> 16
   g1 := c1 >> 8 & 255
   b1 := c1 & 255
   r2 := c2 >> 16
   g2 := c2 >> 8 & 255
   b2 := c2 & 255
   return Sqrt( (r1-r2)**2 + (g1-g2)**2 + (b1-b2)**2 )
}

!,::
	active:=false
	SoundBeep 350, 100
Return

;Auto accept + Auto attack
!.::
	active:=true
	SoundBeep 350, 100
	while(active){
		;Defaults
		;if(clickWhen(, , )) continue
		Sleep 1000

		;Close idm 
		if(clickWhen(789, 534, 0xFCE100, 1149, 477)) 
			continue	
		;Close idm 
		if(clickWhen(791, 544, 0xFCE100, 1146, 485)) 
			continue
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

		;[Done]
		while(active && isAllowMove()){
			;Surender
			if(clickWhen(526, 281, 0xDCA26A, 0, 0))
				continue

			;[Done] Hit
			if(hasEnemy()){
				;MouseMove 600, 400
				;attack()
 				retreat()
			}

			;[Done] Retreat
			if(hitByTower()){ ;From behind
				;MouseMove 500, 500
				retreat()
				Continue
			}

			;[Done] Move player
			Send {Up down}{Right down}
			while(!hasEnemy() && isAllowMove()){
				Send {Up down}{Right down}
				Send {space}
				Send 54321
				Send {space}
				Send {Right up}
				Sleep 210
				Send {space}
				Send {Right down}
				Loop, 7{
					Sleep 100
					Send {space}
				}
				;retreat()
			}
			Send {Up up}{Right up}
			;MouseMove 100, 500
		}

		;If on main menu and not finding match
		if(clickWhen(1057, 252, 0xE3D381, 1094, 460)) 
			continue
		;[Done] If in battle type
		if(clickWhen(1333, 325, 0xCE8C30, 840, 694)){
			Sleep 300
			click(964, 720)
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
		If (equal(color,0xA07D5A)<4){
			click(839, 683)
			click(841, 610)
			Sleep 300
			click(768, 549)
			click(955, 675)
			Continue
		}		

		;[Done] Close dialog event fullscreen
		if(clickWhen(1415, 306, 0x7CCBFF, 1415, 306))
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

		;CLose dialog buy hero
		PixelGetColor, color, 977, 212, RGB
		If (equal(color,0xafb5d9)<4){
			click(977, 212)
			Continue
		}
		

		;[Done] Start game
		PixelGetColor, color, 1157, 423 , RGB
		If (equal(color,0x256DA3)<4){
			click(858, 746)
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
		If (clickWhen(1406, 284, 0xAB1C34, -1, -1)){
			match:=match+1
			commendEveryone()
			follow()
			Sleep 500
			click(1406, 804)
			Sleep 5000
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
	}
Return

!+d::
	Msgbox %match% matches
Return

commendEveryone(){
	Loop 2{
		click(621,432)
		click(620,716)
		click(621,501)
		click(621,648)
		click(623,576)
	}
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

verifyHealthBar(x, y, color){
	dX := x + 6
	PixelGetColor, sideColor, %dX%, %y%
	return true ;(sideColor==color)
}

sensitivity:=4
hasEnemy(){
	hasEnemy := false
	;Enemy creep
	PixelSearch, Px, Py,  735, 308, 1251, 706, 0x664bff, 4, Fast
	If !ErrorLevel{ 
		hasEnemy := true ;verifyHealthBar(%Px%, %Py%, 0x2A24D6)
	}
	PixelSearch, Px, Py,  735, 308, 1251, 706, 0x2A24D6, 4, Fast
	If !ErrorLevel{ 
		hasEnemy := true ;verifyHealthBar(%Px%, %Py%, 0x2A24D6)
	}
	return hasEnemy
}
hasEnemyFromBehind(){
	hasEnemy := false
	PixelSearch, Px, Py,  540, 504, 1043, 934, 0x664bff, 4, Fast
	If !ErrorLevel{ 
		hasEnemy := true ;verifyHealthBar(%Px%, %Py%, 0x2A24D6)
	}
	PixelSearch, Px, Py,  540, 504, 1043, 934, 0x2A24D6, 4, Fast
	If !ErrorLevel{ 
		hasEnemy := true ;verifyHealthBar(%Px%, %Py%, 0x2A24D6)
	}
	return hasEnemy
}
hitByTower(){
	hasEnemy := false
	PixelSearch, Px, Py, 740, 384, 1363, 801, 0x4060A5, 4, Fast
	If !ErrorLevel{ 
		hasEnemy := true ;verifyHealthBar(%Px%, %Py%, 0xE4998D)
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
    Sleep, 400
    Loop 2{
		Loop, 1{
			Send s
			Send {space}fg
	    	Sleep, 200
		}
		Loop, 4{
			Send a
			Send {space}fg
	    	Sleep, 200
		}
		Loop, 3{
			Send d
			Send {space}fg
	    	Sleep, 200
		}
		Send v
	}
}

minAttack(){
	Send a
	Sleep 1000
	Send s
	Sleep 1000
	Send d
	Sleep 1000
	Send v
}

;[Done]
isAllowMove(){
	PixelGetColor, deadColor, 969, 48, RGB
	PixelGetColor, batteryColor, 634, 11, RGB
	allowMove :=batteryColor==0x00F900 && deadColor!=0xFE2619
	
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


click(cx, cy){
	MouseGetPos x, y
	Click %cx%, %cy%
	MouseMove x, y
}

clickWhen(px, py, pcolor, cx, cy){
	PixelGetColor, color, coorX(px), coorY(py), RGB
	If (equal(color, pcolor)<4){
		if(cx==0)
			click(coorX(px), coorY(py))
		if(cx>0)
			click(coorX(cx), coorY(cy))
		
		return true
	}
	return false
}

coorX(x){
	return A_ScreenWidth  * x / actualScreenX
}

coorY(y){
	return A_ScreenHeight  * y / actualScreenY
}

follow(){
	;1
	clickWhen(564, 397, 0xEA6DA6, 583, 431)
	;2
	clickWhen(563, 473, 0xE25693, 582, 502)
	;3
	clickWhen(567, 536, 0xB86D9C, 582, 577)
	;4
	clickWhen(563, 616, 0xDC5994, 582, 643)
	;5
	clickWhen(563, 689, 0xD85590, 582, 719)

	;6
	clickWhen(1355, 400, 0xE35A95, 1333, 426)
	;7
	clickWhen(1355, 473, 0xE45693, 1334, 503)
	;8
	clickWhen(1352, 537, 0xC26992, 1336, 575)
	;9
	clickWhen(1354, 616, 0xDA5790, 1336, 650)
	;10
	clickWhen(1355, 689, 0xE25692, 1333, 718)
}


followAll(){
	;1
	click(583, 431)
	;2
	click(582, 502)
	;3
	click(582, 577)
	;4
	click(582, 643)
	;5
	click(582, 719)

	;6
	click(1333, 426)
	;7
	click(1334, 503)
	;8
	click(1336, 575)
	;9
	click(1336, 650)
	;10
	click(1333, 718)
}