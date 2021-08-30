;AI In Game
#Include ../____Mandatory.ahk
global sensitivity:=4
loop(){
	;In match
	while(isAllowMove()){
		;Surender
		if(clickWhen(526, 281, 0xDCA26A, 0, 0))
			Return

		;[Done] Retreat
		if(hasEnemyFromBehind()){ ;From behind
			;MouseMove 500, 500
			retreat()
			Return
		}

		;[Done] Move player
		saveLastWindow()
		focusAppWindow()
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
		focusLastWindow()
	}
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

halfRetreat(){
	saveLastWindow()
	focusAppWindow()
	MouseGetPos x, y
	MouseMove 640, 948
	Send {c down}
	Sleep 250
	Send {c up}
	MouseMove x, y
	focusLastWindow()
}

retreat(){
	saveLastWindow()
	focusAppWindow()
	Send {Up up}{Right up}
	Send {Down down}{Left down}
	Sleep 1900
	Send {Down down}{Left up}
	Sleep 200
	Send {Down up}{Left up}
	focusLastWindow()
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
	saveLastWindow()
	focusAppWindow()
	Send {Up up}{Right up}{Down up}{Left up}
	Send cc
	Sleep 8500
	focusLastWindow()
}


attack(){
	saveLastWindow()
	focusAppWindow()
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
	focusLastWindow()
}

;[Done]
isAllowMove(){
	;PixelGetColor, deadColor, 969, 48, RGB
	PixelGetColor, batteryColor, 625, 11, RGB
	allowMove :=equal(batteryColor,0x00F900)<4 ;&& deadColor!=0xFE2619
	return allowMove
}

leaveBase(){
	saveLastWindow()
	focusAppWindow()
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
	focusLastWindow()
}

while(true)
	loop()
!p::ExitApp
#Include __Basic.ahk