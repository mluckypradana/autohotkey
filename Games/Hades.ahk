

global assistEnabled:=true
global tapEnabled:=true
global buyEnabled:=false
global hasEnemy:=false
global withQ:=true
global isFastForward:=false

#Include ../___Basic.ahk

!p::ExitApp


#if WinActive("ahk_exe Hades.exe")
!z::
	assistEnabled:=false
	SoundBeep 350, 100
Return
!x::
	SetKeyDelay, 0, 10
	SetMouseDelay, 1, 1
	assistEnabled:=true
	SoundBeep 350, 100
	while(assistEnabled){
		if (WinActive("Hades")){
			;Gift
			if(isColor(1034, 1022, 0xE5D7C3)||isColor(1040, 1008, 0xFFBC0E)||isColor(1041, 1036, 0xFF7701)
				||isColor(1047, 1031, 0xBA4F05))
				Send g
			
			;Cast shot
			if(isColor(66, 1016, 0x9A2B2A)){ ;If has health, has gauge and god gauge is full
				if(!isColor(70, 1055, 0x272727)){
					setFastForward(true)
					attack()
				}
				else{
					setFastForward(false)
				}
			}
			;Warning low health
			if(isColor(63, 1018, 0x9B2929) && isColor(347, 1016, 0x000000) && !isColor(1165, 277, 0x353432)){
				Send {Esc}
				Sleep 2000
			}

			;Return
				
				;Should proceed
				;Get coin
				;Buy boon
				;Talk
				;Accept boon
			if(	(isColor(894, 1020, 0x55544A) && isColor(1049, 1017, 0xFFFFFF))
				|| isColor(1070, 1009, 0xE0BE32)
				|| (isColor(923, 1020, 0x55544A) && isColor(1013, 1004, 0xFBFBFB))
				|| (isColor(919, 1020, 0x55544A) && isColor(1020, 1020, 0xFCFCFC))
				|| (isColor(902, 1021, 0x515046) && isColor(1040, 1002, 0xFFFFFF))
				|| (isColor(812, 1020, 0x55544A) && isColor(1122, 1008, 0xFFFFFF))

				
				;Restore 0
				;Buy titan blo0d
				;Buy power-up
				;Gain diamond
				;Play harp
				|| (isColor(856, 1020, 0x55544A) && isColor(1076, 1006, 0x87EB40))
				|| (isColor(882, 1022, 0x515046) && isColor(1038, 1015, 0xD50000))
				|| (isColor(836, 1020, 0x55544A) && isColor(1099, 1009, 0xFFFFFF))
				|| isColor(1065, 1009, 0x00AF55)
				|| (isColor(913, 1016, 0x40413F) && isColor(1027, 1007, 0xFFFFFF))


				;Gain drakness
				;Power up
				;Upgrade
				;Buy darkness
				;Gain nectar
				|| isColor(960, 1013, 0xE823FF)
				|| (isColor(874, 1021, 0x515046) && isColor(1063, 1005, 0xFFFFFF))
				|| (isColor(875, 1016, 0x464646) && isColor(1055, 1018, 0xFEFEFE))
				|| isColor(1045, 1012, 0xEA23FF)
				|| isColor(1048, 1018, 0xC35800)

				;Return
				;Gain titan blood
				;Leave
				;Gain key
				;Gain diamond
				|| (isColor(894, 1019, 0x626254) && isColor(1043, 1009, 0xFFFFFF))
				|| isColor(1041, 1012, 0xD80000)
				|| isColor(944, 1009, 0xFFE835)
				|| isColor(925, 1013, 0xE1CCF5)
				|| isColor(1048, 1010, 0xF8F9F2)	){
				Send e
			}
		}
	}
Return

!c::
	if(isColor(53, 33, 0xFFFF80)) return
	MouseMove 637, 783
	click(637, 783)
	Click, Down
	Sleep 75
	Click, Up

	MouseMove 633, 562
	Sleep 75
	click(633, 562)
	Click, Down
	Sleep 75
	Click, Up

	
	MouseMove 764, 974
	Sleep 75
	click(764, 974)
	Click, Down
	Sleep 75
	Click, Up
	
	Sleep 200
Return

!+q::
	withQ:=!withQ
Return
setFastForward(forward){
	if(forward){
		if(!isFastForward){
			Send ^5
			isFastForward:=true
		}
	}
	else{
		if(isFastForward){
			Send ^4
			isFastForward:=false
		}
	}
}
!q::
	stopAttack()
Return
!e::
	startAttack()
Return
stopAttack(){
	untapButtons()
	Send ^4
	tapEnabled:=false
	SoundBeep 350, 100
}
global noEnemyValid:=0
startAttack(){
	untapButtons()
	Send ^5
	SetKeyDelay, 0, 10
	SetMouseDelay, 1, 1
	tapEnabled:=true
	SoundBeep 350, 100
	noEnemyValid:=0
	while(tapEnabled){
		if (WinActive("Hades")){
			attack()
			if(isColor(80, 1056, 0x292929)){
				if(noEnemyValid>15)
					stopAttack()
				else{
					noEnemyValid:=noEnemyValid + 1
				}
			}
			else
				Send f
		}
	}
}
attack(){
	if(!isColor(1048, 1017, 0xFFFFFF)){
		Click, L
		Send t
		if(withQ)
			Send q
	}
	else{
		Send e
	}
}

#if WinActive("ahk_exe cheatengine-x86_64.exe")
!1::Send 6
!2::Send 7
!3::Send 8
!4::Send 9
!5::Send 0
!q::
	click(1101, 541)
	Send ^a
	Send {del}{enter}
	click(1628, 180)
	Send ^{a}
	Send {BackSpace}
Return
!w::
	click(1094, 163)
	Send ^a
	click(1529, 461)
	click(1360, 544)
	Send ^a
	Send {Enter}30000{Enter}
Return
!g::Send {Enter}30000{Enter}