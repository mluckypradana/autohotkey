;Daily quest
#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1
loop(){
	handleDailyChest()
}

handleDailyChest(){
	if(clickWhen(494, 581, 0xB9394A, 0, 0))
		Return true ;Claim gold chest

	if inDailyQuest(){	;In daily quests
		if(clickWhen(646, 369, 0x9C4CA5, 1332, 364)){ ;Share game
			waitClick(1283, 793, 0x4D6895)
			waitClick(1285, 745, 0x4C6895)
			pixelWait(979, 16, 0xF7F8FA)
			escape()
			return true
		}
		if(clickWhen(1452, 265, 0xA4805B, 1452, 265))
			Return true ;Claim daily quests
		;Claim daily reward coin 1
		if clickWhen(719, 728, 0xB8384A, 0, 0)
			return true
		;Claim daily reward coin 2
		if clickWhen(832, 729, 0xB23345, 0, 0)
			return true
		;Claim daily reward coin 3
		if clickWhen(947, 729, 0xB03244, 0, 0)
			return true
		;Claim daily reward coin 4
		if clickWhen(1060, 729, 0xB43547, 0, 0)
			return true
		;Claim weekly blue treasure
		if clickWhen(1248, 745, 0xBB3A4C, 0, 0)
			return true
		;CLaim weekly purple treasure
		if clickWhen(1421, 745, 0xBB3A4C, 0, 0)
			return true
	}
	;Claim all daily reward chest
	if(c(554, 339, 0x8DDFFF) && c(1329, 271, 0x9F876B)){
		click(1328, 269)
		return true
	}

	;Is in celestial page
	if(c(551, 457, 0x8CDEFF)){
		;Claim celestial reward 1
		if clickWhen(904, 421, 0xAC926D, 0, 0)
			return true
		;Claim celestial reward 2
		if clickWhen(911, 526, 0xA78E6C, 0, 0)
			return true
		;Claim celestial reward 3
		if clickWhen(904, 632, 0xAC926D, 0, 0)
			return true
		;Claim celestial reward 4
		if clickWhen(908, 738, 0xAA916D, 0, 0)
			return true
	}

	return false
}
inDailyQuest(){
	return c(1118, 680, 0xA97F68)
}

while(true)
	loop()
!p::ExitApp
#Include __Functions.ahk