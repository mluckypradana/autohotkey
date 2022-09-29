;Events
#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1
loop(){
	handleEvent()
}
handleEvent(){
	if(c(1074, 253, 0x58BFE8) && c(1305, 262, 0x4565F3)){ ;In event
		;In daily tasks or weekend revelry or limited event
		if c(1443, 369, 0x072445) {
			clicked:=false
			;Claim fourth reward
			if clickWhen(1320, 736, 0x998165, 0, 0)
				clicked:=true
			;Claim third reward 
			if clickWhen(1320, 634, 0x978168, 0, 0)
				clicked:=true
			;Claim second reward
			if clickWhen(1326, 527, 0x9C8469, 0, 0)
				clicked:=true
			;Claim first reward
			if clickWhen(1326, 418, 0x9C8469, 0, 0)
				clicked:=true
			if(clicked)
				return true
		}
		
		if(c(807, 681, 0xF5E5CC) && c(1044, 673, 0xF9E9D0)) { ;In Weekend benefits
			clicked:=false
			if !c(866, 788, 0xB39261){
				click(868, 773)
				clicked:=true
			}
			if !c(1095, 789, 0xB39261){
				click(1095, 789)
				clicked:=true
			}
			if !c(1318, 787, 0xB39261){
				click(1318, 787)
				clicked:=true
			}
			if(clicked)
				return true
		}
	}

	if(c(1256, 249, 0xEED277) && c(1368, 254, 0x4564F5)) { ;In draw skin special event
		if(c(536, 578, 0xB8394B)) ;Click daily supply
			click(509, 596)
		return true
	}
	

	;Claim 7-day login reward
	if c(1411, 326, 0xE6EEF1) {
		clickWhen(1177, 770, 0x9A8269, 0, 0)
		clickWhen(1411, 327, 0xF4F7F7, 0, 0)
		return true
	}
	;If 7-day login reward claimed, not int match
	if c(1196, 736, 0x444444) && c(1368, 737, 0x434343) && c(960, 101, 0x0B090D) {
		escape()
		return true
	}
	
	;MC daily surprise
	if c(1066, 765, 0x01CEFE) && c(1364, 766, 0xE4E381) && c(499, 567, 0xBE3C4E){
		click(499, 567)
		return true
	}
	return false
}
while(true)
	loop()
!p::ExitApp
#Include __Basic.ahk