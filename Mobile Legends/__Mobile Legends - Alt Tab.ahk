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
global sensitivity:=12

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

![::
	active:=false
	SoundBeep 350, 100
Return

;Auto accept + Auto attack
!]::
	active:=true
	SoundBeep 350, 100
	while(active){
		Send !{tab}
		Sleep 15000
	}
Return

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
	Msgbox %match% matches
Return

commendEveryone(){
	Loop 2{
		click(449,432)
		click(449,716)
		click(449,501)
		click(449,648)
		click(449,576)
	}
	click(561, 426)
	click(1357, 425)
}


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
	PixelGetColor, color, %x%, %y%
	dX := x + 5
	PixelGetColor, sideColor, %dX%, %y%
	isHealthBar := equal(sideColor,color)<sensitivity
	xValid := x<931 || x>974
	yValid := y<529 || y>589
	return (xValid || yValid) && isHealthBar
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
		PixelSearch, Px, Py, 718, 194, 1292, 749, %enemyColor%, %sensitivity%, Fast
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
		Send v
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
	;1 (Done)
	clickWhen(614, 407, 0xDD5590, 496, 422)
	;2 (Done)
	clickWhen(613, 479, 0xC6518A, 496, 494)
	;3 (Done)
	clickWhen(614, 552, 0xDF528E, 496, 567)
	;4 (Done)
	clickWhen(614, 624, 0xE2528F, 496, 639)
	;5 (Done)
	clickWhen(613, 695, 0xB84D83, 496, 715)

	;6
	clickWhen(1306, 405, 0xC55687, 1421, 430)
	;7 
	clickWhen(1307, 479, 0xE05692, 1423, 496)
	;8 (Done)
	clickWhen(1306, 551, 0xE15691, 1424, 569)
	;9 
	clickWhen(1306, 624, 0xD54F88, 1422, 641)
	;10
	clickWhen(1306, 695, 0xC94F85, 1420, 716)
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