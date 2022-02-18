;Arena match
#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1

global winRemaining:=5

loop(){
	Sleep 500
	if c(571, 351, 0x5AD3E6){
		click(569, 354)
		return
	}
	;Podium
	if c(633, 445, 0x283F5B){
		click(633, 445)
		return
	}
	;Go
	if c(1015, 808, 0x6ADADE){
		click(1015, 808)
		return	
	}
	;Shop
	if c(499, 416, 0xFFF1E9){
		click(467, 361)
		return
	}
	;Buy hero
	if c(707, 692, 0xFFF1E9){
		click(670, 631)
		return
	}
	;Use battle point
	if c(1102, 775, 0xFFF1E9){
		click(1062, 721)
		return
	}
	;Okay hero
	if c(1431, 757, 0xFFF1E9){
		click(1400, 807)
		return
	}
	;Okay
	if c(1119, 717, 0xFFFBE9){
		click(1080, 677)
		return
	}
	;Back
	if c(529, 311, 0xFFF1E9){
		click(488, 256)
		return
	}
	;Classic (default)
	if c(910, 723, 0xF0D57D){
		click(910, 723)
		return
	}
	;Group join?
	if c(756, 680, 0x4D6996){
		click(819, 678)
		return
	}
	;Classic
	if c(995, 778, 0xFFF3E9){
		click(952, 731)
		return
	}
	;Event
	if c(493, 489, 0xFFF5E9){
		click(466, 429)
		return
	}
	;Claim event
	if c(1230, 736, 0xFFF1E9){
		click(1202, 681)
		return
	}
	;Obtain reward
	if c(713, 786, 0xAA8F70){
		click(756, 777)
		Sleep 3000
		clickWhen(481, 255, 0x8CA3D6, 0, 0) ;Back
		return
	}
	;Gold chest
	if c(494, 635, 0xFFFBE9){
		click(468, 598)
		return
	}
	;Return
	if c(1419, 842, 0xFFF1E9){
		click(1406, 810)
		return
	}
	;Daily
	if c(548, 766, 0xFFF1E9){
		click(522, 804)
		return
	}
	;Claim all
	if c(1330, 268, 0x9F866B){
		click(1335, 265)
		return
	}
	;Obtained reward okay
	if c(859, 307, 0xB3D7F5){
		click(906, 779)
		Sleep 3000
		return
	}
	;Preparation
	if c(810, 758, 0xFFF9E9){
		click(812, 803)
		return
	}
	;Unlock emblem
	if c(1285, 662, 0xFFF3E9){
		click(1257, 602)
		return
	}
	;Choose emblem type
	if c(663, 376, 0xFFF5E9){
		click(624, 340)
		return
	}
	;Upgrade
	if c(1042, 735, 0xA28A6C){
		click(1048, 737)
		Sleep 1000
		click(813, 731) ;Cancel
		return
	}
	;Next
	if c(1463, 543, 0x8EA6CC){
		click(1463, 543)
		return
	}
	;Ok guide
	if c(910, 770, 0xA58C6C){
		click(909, 777)
		return
	}
	;Achievement
	if c(1139, 761, 0xFFF5E9){
		click(1083, 812)
		return
	}
	;Emblem || Event, back
	if c(894, 259, 0xB29978) || c(1029, 267, 0xD38AEA) || c(1194, 350, 0xFBACAC){
		clickWhen(481, 255, 0x8CA3D6, 0, 0) ;Back
	}
}

while(true)
	loop()
!p::ExitApp

#Include __Basic.ahk