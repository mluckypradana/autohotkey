;AI In Game
#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1
global sensitivity:=4
loop(){
	;In match
	if(isAllowMove()){

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
		saveFocusWindow()
		Send {Up down}{Right down}
		;focusLastWindow()

		while(isAllowMove()){
			if(attackWhenHasEnemy())
				break
			saveFocusWindow()
			Send 45321
			Send {Up down}{Right down}
			Send g ;{space}
			Send g ;{space}
			Send {Right up}
			focusLastWindow()

			Sleep 210
			
			if(attackWhenHasEnemy())
				break
			
			saveFocusWindow()
			Send g ;{space}
			Send {Right down}
			;focusLastWindow()

			Loop, 7{
				Sleep 100
				saveFocusWindow()
				Send g ;{space}
				;focusLastWindow()
			}
			if(attackWhenHasEnemy())
				break
			if(stuckAtRight()){
				saveFocusWindow()
				Send {Up down}{Right up}
				;focusLastWindow()
				
				Sleep 3000
				
				saveFocusWindow()
				Send {Up up}{Right up}
				;focusLastWindow()
			}
		}
		saveFocusWindow()
		Send {Up up}{Right up}
		;focusLastWindow()
	}
}
saveFocusWindow(){
	saveLastWindow()
	focusAppWindow()
}


attackWhenHasEnemy(){
	if(hasEnemy()){	
		attack()
		halfRetreat()
 		retreat()
 		tooltip("Has enemy")
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
	MouseGetPos x, y
	MouseMove 640, 948
	saveFocusWindow()
	Send {c down}
	;focusLastWindow()

	Sleep 250

	saveFocusWindow()
	Send {c up}
	;focusLastWindow()

	MouseMove x, y
}

retreat(){
	saveFocusWindow()
	Send {Up up}{Right up}
	Send {Down down}{Left down}
	;focusLastWindow()

	Sleep 1900

	saveFocusWindow()
	Send {Down down}{Left up}
	;focusLastWindow()

	Sleep 200

	saveFocusWindow()
	Send {Down up}{Left up}
	;focusLastWindow()
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
	saveFocusWindow()
	Send {Up up}{Right up}{Down up}{Left up}
	Send cc
	;focusLastWindow()
	Sleep 8500
}


attack(){
	saveFocusWindow()
	Send {Up up}{Right up}
	Send +{r}
	;focusLastWindow()

	Sleep, 400
	Loop 2{
		Loop, 1{
			saveFocusWindow()
			Send sf
			;focusLastWindow()

	    	Sleep, 200
		}
		
		saveFocusWindow()
		Send vvv
		;focusLastWindow()
		
		Loop, 4{
			saveFocusWindow()
			Send af
			;focusLastWindow()

	    	Sleep, 200
		}
		Loop, 3{
			saveFocusWindow()
			Send df
			;focusLastWindow()

	    	Sleep, 200
		}
		saveFocusWindow()
		Send +{r}
		;focusLastWindow()
	}
}

;[Done]
isAllowMove(){
	return c(627, 11, 0x00F900) && !c(962, 696, 0x9E3626)
}

leaveBase(){
	saveFocusWindow()
	Send {Up up}{Right up}
	Send {Up down}{Right down}
	;focusLastWindow()

	x := 0
	while(x<5){
		;Move a bit
		saveFocusWindow()
		Send {Up up}{Right down}
		;focusLastWindow()

		Sleep 100

		saveFocusWindow()
		Send {Up down}{Right down}
		;focusLastWindow()

		Sleep 600

		saveFocusWindow()
		Send {space}
		;focusLastWindow()

		x := x+1
	}

	saveFocusWindow()
	Send {Up up}{Right up}
	;focusLastWindow()
}

while(true)
	loop()
!p::ExitApp
#Include __Functions.ahk