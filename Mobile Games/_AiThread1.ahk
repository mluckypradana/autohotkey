;AI Base
#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1

global brawlMatch:=false ;Means its AI
global memberDeleted:=false
global memberSorted:=false
global firstGroupManaged:=false
global secondGroupManaged:=false
global withSquadInvite:= false
global withGroupInvite:= true
global withDeleteMember:= true
isFullMember(){
	return c(1460, 821, 0x5C77A3)
}
loop(){
	;Back to lobby
	if(isColor(999, 729, 0x4873D2) && isColor(922, 241, 0x74A8B4)){
		click(999, 729)
		Return
	}

	;Close dialog invite 
	if (isColor(1142,592, 0xA07D5A)|| isColor(837, 688, 0x0D2136) || isColor(835, 676, 0x0B1B2C) || isColor(839, 679, 0x0C1E31)){
		ignoreInvite()
		return
	}

	;If on main menu and not finding match
	if(c(1311, 505, 0xDEA500)&&c(1048, 243, 0xF6EE93)) {
		;Click return to lobby if already in lobby
		if(clickWhen(922, 737, 0x4F8BE4, 0, 0)) 
			Return

		if(withDeleteMember && !secondGroupManaged){
			if(!firstGroupmanaged)
				click(1319, 401)
			else{
				memberDeleted:=false
				click(1317, 492)
			}
		}else
			click(959, 550)
		Return
	}

	;Click group setting & type something
	if(isColor(620, 306, 0xB0C4DD)){
		click(620, 315)
		Return
	}

	;If is in group members
	if(isColor(458, 277, 0xDDA601)||isColor(452, 262, 0xAE360B)){
		if(memberDeleted){
			click(1443, 265)
			Sleep 500
			click(1423, 265)
			memberSorted:=false

			if(!firstGroupManaged)
				firstGroupManaged:=true
			else if(!secondGroupManaged)
				secondGroupManaged:=true
			Return
		}
		if(!isFullMember()){
			memberDeleted:=true
			click(526, 657)
			waitClick(506, 576, 0x25629C)
			Return
		}
		if(memberSorted){
			;Delete member
			if(!memberDeleted && !isColor(1344, 492, 0x529457)){
				followAndRemoveMember()
			}
			memberDeleted:=true
			Return
		
		}
		else{				
			;Sort member
			followMembers()
			click(1334, 319)
			memberSorted:=true
			Return
		}
	}

	if(clickWhen(853, 699, 0x8D774F, 959,550)) 
			Return
	;If brawlMatch, pick brawl match in battle type
	
	;[Done] If in battle type pick AI
	if(isColor(1344, 613, 0xE09E33)){
		if(brawlMatch)
			click(559, 693)
		else
			click(839, 697)
		Sleep 1500
		click(973, 726)
		
		Return
	}

	;[Done] If in vs AI mode, click(brawl
	if(clickWhen(644, 342, 0x96E0E9, 824, 504)){
		waitClick(773, 513, 0x356EAE)
		Return
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
		Return
	}
	
	;If not connected
	if(clickWhen(1093, 655, 0xAF855D, 1097, 671))
		Return

	;Network connection failed
	if(isColor(896, 397, 0x7A8EB6)&&isColor(1160, 665, 0xAC845D)){
		click(1082, 652)
		Return
	}
	
	;[Done] Start game
	if(clickWhen(856, 766, 0xD6A668, -1, -1)){
		;Prevent start game when not AI
		;if(!isColor(739, 260, 0x17E700)){
		;	click(470, 260)
		;}			
		;else{
			if(withGroupInvite){
				click(1061, 812)
				if(withSquadInvite)
					waitClick(1058, 699, 0x2B5087)
				waitClick(1023, 736, 0x25477A) ;Click group invite
				waitClick(862, 756, 0x1D3866) ;Invite all
				pixelWait(1112, 723, 0x0E1C32)
				Loop 6{
					click(1067, 840)
				}
				sleep 10000
			}
			click(858, 746)
			memberDeleted:=false
			firstGroupManaged:=false
			secondGroupManaged:=false
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
		Return
	}

	;[Done] Accept  (Enter)
	If (c(845, 769, 0xBF9E65)){
		click(845, 769)
		Return
	}

	;[Done] Accept Game Ramadhan
	PixelGetColor, color, 801, 432, RGB
	If (equal(color,0x037371)<4){
		click(964, 744)
		Return
	}

	;Match up delay
	PixelGetColor, color, 1043, 651, RGB
	If (equal(color,0xDCA16A)<4){
		click(1043, 651)
		Return
	}

	;[Done] In brawl picker
	PixelGetColor, color, 1094, 784, RGB
	If (equal(color,0xA5805B)<4){
		click(877, 494)
		click(1022, 784)
		Return
	}

	;AFK when start game
	if(clickWhen(909, 646, 0xB2885F, 909, 646)){
		Return
	}
	;Violation Notice
	if(clickWhen(1156, 488, 0xED4242, 966, 741))
		Return
	
	;AFK
	PixelGetColor, color, 959, 656 , RGB
	If (equal(color,0xB0865E)<4){
		click(954, 670)
		Return
	}

	;AFK After match
	PixelGetColor, color, 682, 502, RGB
	If (equal(color,0x13852e)<4){
		click(682, 502)
		Return
	}

	;[Done] Victory prompt
	if(clickWhen(968, 484, 0xDFA774, 0, 0))
		Return
	
	;Defeat prompt
	if(clickWhen(753, 536, 0x661110, 0, 0))
		Return

	;[Done] Return summary graph
	PixelGetColor, color, 451, 803 , RGB
	If (equal(color,0xAAC3E1)<4){
		click(1359, 802)
		Return
	}

	;[Done] Return Achievement
	If c(1463, 745, 0x294E77) && c(1469, 809, 0xA9825C) {
		click(1469, 809)
		return true
	}

	;[Done] Achievement popup emblem
	PixelGetColor, color, 1379, 805, RGB
	If (equal(color,0xDDA26A)<4){
		click(1379, 805)
		Return
	}

	;Credit celestial level
	PixelGetColor, color, 959, 814, RGB
	If (equal(color,0xDAA069)<4){
		click(959, 814)
		Return
	}

	;Credit score prompt
	PixelGetColor, color, 757, 490 , RGB
	If (equal(color,0x46AF3D)<4){
		click(953, 741)
		Return
	}

	;Return bp collected
	PixelGetColor, color, 790, 584, RGB
	If (equal(color,0x138830)<4){
		click(790, 584)
		Sleep 5000
		Return
	}

	;Return bp collected 2
	PixelGetColor, color, 1360, 819 , RGB
	If (equal(color,0xDAA069)<4){
		click(1360, 819)
		Sleep 5000
		Return
	}

	;Return statistic
	If (isColor(483, 813, 0x27588A)&&isColor(1161, 380, 0x959096)){
		match:=match+1
		follow()
		commendEveryone()
		Sleep 500
		click(1351, 803)
		Sleep 1000
		Return
	}

	;Commend all
	if(clickWhen(815, 376, 0x6F7F94, -1, -1)){
		follow()
		commendEveryone()
		Return
	}

	;Return finish match rank
	PixelGetColor, color, 451, 800 , RGB
	If (equal(color,0xB8D1EA)<4){
		click(1361, 803)
		Return
	}

	;Rate
	PixelGetColor, color, 967, 421, RGB
	If (equal(color,0xF5DCED)<4){
		click(1100, 443)
		Return
	}

	;Close all kind of dialog
	if c(1396, 818, 0x06070B)
	|| c(1478, 251, 0x011509) {
		escape()
		tooltip("Close all kind of dialog")
	}

	;Close dialog game guardian
	if c(529, 818, 0x424242) && c(567, 818, 0xFFFFFF) && c(494, 249, 0x424242) {
		click(559, 820)
		return true
	}
}

followAndRemoveMember(){
	followMembers()
	;removeMember(1441, 745)
	;removeMember(1444, 670)
	;removeMember(1445, 616)
	removeMember(1444, 554)
	removeMember(1445, 489)
	removeMember(1443, 430)
}

followMembers(){
	;1
	if c(627, 442, 0xC15E88)
		followMember(406)
	;2
	if c(627, 509, 0xD35189)
		followMember(470)
	;3
	if c(627, 572, 0xE45591)
		followMember(537)
	;4
	if c(627, 634, 0xE15994)
		followMember(597)
	;5
	if c(627, 697, 0xDD5690)
		followMember(660)
	;6
	if c(627, 760, 0xD9538C)
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
	pixelWait(1095, 690, 0xDDA26A)
	PixelGetColor color, 1095, 692, RGB
	clickWhen(1095, 692, 0xDAA069, 0, 0)
	Sleep 200
}
while(true)
	loop()
!p::ExitApp
#Include __Basic.ahk