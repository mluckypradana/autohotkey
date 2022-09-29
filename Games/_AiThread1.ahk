;AI Base
#SingleInstance force

global brawlMatch:=false ;Means its AI
global memberDeleted:=false
global memberSorted:=false
global firstGroupManaged:=false
global secondGroupManaged:=false
global withSquadInvite:= false
global withGroupInvite:= true
global withDeleteMember:= true
global withAutoShutdown:= true

isFullMember(){
	return c(1454, 816, 0x8AA1D0) || c(1272, 757, 0x233A56)
}
loop(){
	;Back to lobby
	if(isColor(999, 729, 0x4873D2) && isColor(922, 241, 0x74A8B4)){
		click(999, 729)
		Return
	}
	
	;Back from download arcade game
	if c(611, 802, 0x57636C) && c(474, 255, 0x95B0E7) {
		forceBack()
		tooltip("Back from download arcade game")
		return true
	}

	;Find match when internet connection is bad
	if c(765, 749, 0x2E2720) && c(736, 682, 0x4C6895) && c(1016, 680, 0x9C856A) {
		click(1016, 680)
		return true
	}

	;Close dialog invite 
	if (isColor(1142,592, 0xA07D5A)|| isColor(837, 688, 0x0D2136) || isColor(835, 676, 0x0B1B2C) || isColor(839, 679, 0x0C1E31)){
		ignoreInvite()
		return
	}

	;Penalty
	if c(883, 685, 0xA2896D) {
		escape()
		Return
	}

	;Accept Game, Enter
	If c(832, 510, 0xBFB58E) || c(798, 514, 0x91A3A7) {
		click(861, 751)
		Return
	}

	;If on main menu and not finding match
	if c(1025, 265, 0xD4C76A) {
		if withAutoShutdown && A_Hour == 5 {
			runCommand("rundll32.exe powrprof.dll, SetSuspendState Sleep")
			return
		}

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
			click(1239, 406)
		Return
	}

	;Click group setting
	if clickWhen(739, 813, 0x213552, 438, 360)
		return

	;If is in group members (close button & trash button)
	if c(532, 279, 0xD44050) {
		if(memberDeleted){
			escape()
			pixelWait(882, 811, 0x4874B3)
			escape()
			memberSorted:=false

			if(!firstGroupManaged)
				firstGroupManaged:=true
			else if(!secondGroupManaged)
				secondGroupManaged:=true
			Return
		}
		if(!isFullMember()){
			memberDeleted:=true
			;Invite via public
			;click(546, 759)
			;waitClick(506, 576, 0x25629C)
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
	if c(631, 278, 0x62DAE4){
		if(brawlMatch)
			click(559, 693)
		else
			click(839, 697)
		Return
	}

	;[Done] If in vs AI mode, click classic
	if c(656, 566, 0xFAD15D){
		click(772, 513)
		waitClick(772, 514, 0x356EAE)
		Return
	}

	;If confirm hero in brawl
	if c(954, 782, 0x9B8369){
		click(954, 782)
		return
	}

	;[Done] In picker
	If c(867, 670, 0x09B8E1){
		click(952, 781)
	}
	
	;If not connected
	if(clickWhen(1093, 655, 0xAF855D, 1097, 671))
		Return

	;Network connection failed
	if c(752, 684, 0x4E6B9A) && c(1027, 684, 0xA78D6D){ ;
		click(1030, 679) ;Okay
		Return
	}
	
	;[Done] Start game
	if c(769, 745, 0xA08968) {	
		if(withGroupInvite){
			click(741, 378)
			if(withSquadInvite)
				waitClick(1288, 704, 0x7CADD6)
			click(1471, 707) ;Click group invite
			waitClick(1469, 824, 0x4A6592) ;Invite all
			sleep 10000
		}
		click(755, 745)
		memberDeleted:=false
		firstGroupManaged:=false
		secondGroupManaged:=false
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
	if c(457, 668, 0xB5394A) && c(462, 659, 0xFDECEC){
		escape()
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

	;Continue victory, exp, graph, performance
	if c(1459, 796, 0x9F876B){
		click(1459, 796)
		return true
	}

	;[Done] Return summary graph
	If c(1285, 806, 0xA0876B) {
		click(1359, 802)
		Return
	}

	;[Done] Return Achievement
	If c(1334, 809, 0x9F876B) {
		click(1406, 809)
		return true
	}

	;Continue Achievement
	if c(1465, 746, 0xA2896B) {
		click(1465, 746)
		return true
	}

	;Match rate record
	if c(1360, 814, 0x3954A1) && c(1477, 829, 0x57B962) {
		click(1291, 742)
		return true
	}

	;[Done] Achievement popup emblem
	PixelGetColor, color, 1379, 805, RGB
	If (equal(color,0xDDA26A)<4){
		click(1379, 805)
		Return
	}

	;Credit celestial level
	if c(882, 804, 0xA48B6F){
		click(882, 804)
		Return
	}

	;Credit score prompt
	PixelGetColor, color, 757, 490 , RGB
	If (equal(color,0x46AF3D)<4){
		click(953, 741)
		Return
	}

	;Match up prompt
	if c(1207, 391, 0xF9FAFC){
		click(957, 679)
		return
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
	If c(1463, 813, 0x4B6794) {
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
		
		;Is daily follow already limited
		pixelWait(964, 509, 0x181822)
		if c(964, 509, 0x181822){
			Msgbox Daily Follow Limited
			ExitApp
		}
		Return
	}

	;Return finish match rank
	PixelGetColor, color, 451, 800 , RGB
	If (equal(color,0xB8D1EA)<4){
		click(1361, 803)
		Return
	}

	;Close Rate dialog
	PixelGetColor, color, 967, 421, RGB
	if(c(1093, 453, 0xF2F5F8) && c(852, 678, 0x182433)){ ;Close button and rate button
		escape()
		return
	}
	If (equal(color,0xF5DCED)<4){
		clickWhen(738, 681, 0x4C6793, 0, 0)
		Return
	}

	;Back from starlight
	if c(445, 265, 0xEAE1C1) && c(550, 750, 0xD8AF6D) {
		click(445, 265)
		return
	}

	;Close cancel matchmaking dialog
	if c(739, 682, 0x4C6895) {
		escape()
		Return
	}

	;Close all kind of dialog
	if c(1464, 275, 0x011509) || c(1466, 270, 0x01130B) {
		escape()
		tooltip("Close all kind of dialog")
	}

	;Back from someone's channel
	if c(1263, 269, 0x4461F1) && hasBackButton() {
		click(460, 257)
		return
	}

	;Close dialog game guardian
	if c(529, 818, 0x424242) && c(567, 818, 0xFFFFFF) && c(494, 249, 0x424242) {
		click(559, 820)
		return true
	}

	;Close national arena contest
	if c(1021, 328, 0x5E83B8) && c(479, 255, 0x8BA2D4){
		click(473, 255)
	}

	;Close webview dialog
	if c(1349, 815, 0xAAAAAA){
		click(1349, 815)
		return true
	}

	;Back from arcade game
	if c(1419, 261, 0xA4B5D7) && c(969, 332, 0x77CAFE) {
		back()
		return true
	}

	;Close exit dialog
	if c(1060, 741, 0x875469) {
		escape()
		return true
	}
}
hasBackButton(){
	return c(461, 254, 0xFFE1AE)
}
followAndRemoveMember(){
	followMembers()
	;removeMember(1441, 745)
	;removeMember(1444, 670)
	removeMember(1445, 616)
	removeMember(1444, 554)
	removeMember(1445, 489)
	removeMember(1443, 430)
}
followMembers(){
	;1
	if c(627, 447, 0xECA4E8) || c(627, 439, 0x8E4D97)
		followMember(406)
	;2
	if c(621, 509, 0x8C4B91) || c(627, 501, 0x8F4D97) || c(627, 510, 0xEDA2E9)
		followMember(470)
	;3
	if c(621, 571, 0x8F4A90) || c(620, 571, 0x924D95) || c(627, 572, 0xF5ACF0) || c(626, 564, 0x9A5499)
		followMember(537)
	;4
	if c(627, 627, 0x8A4C94) || c(627, 628, 0x944E90) || c(627, 628, 0x8F4D97) || c(634, 634, 0x974E91) || c(627, 636, 0xEFA4EA)
		followMember(597)
	;5
	if c(621, 697, 0x9F579E) || c(627, 690, 0x8E4D97) || c(633, 698, 0xA0599A) || c(627, 698, 0xF5ACF0)
		followMember(660)
	;6
	if c(620, 760, 0x9E58A0) || c(627, 753, 0xA35DA0) || c(627, 761, 0xF6ACF1)
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
	waitClick(1023, 679, 0xA0886B)
	Sleep 200
}
while(true)
	loop()
!p::ExitApp

#Include __Basic.ahk