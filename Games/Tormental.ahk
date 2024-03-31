

global assistEnabled:=true
global tapEnabled:=true
global buyEnabled:=false
global hasEnemy:=false
global withQ:=true
global isFastForward:=false

#Include ../___Basic.ahk

!p::ExitApp


;#if WinActive("ahk_exe Tormental.exe")
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
		;if c(127, 60, 0xD3F212){
			Click R
			Sleep 100
		;}
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