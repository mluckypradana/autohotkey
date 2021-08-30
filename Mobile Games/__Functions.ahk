#Include ../___Basic.ahk

confirmBuyMagicDust(){
	waitClick(901, 714, 0xBE63E0) ;Buy
	pixelWait(928, 540, 0x8532AF)
	click(1068, 682) ;Confirm
	pixelWait(686, 344, 0x777870)
}
back(){
	waitClick(459, 256, 0xFFDEAB)
}
useBundleInventory(){
	;In inventory
	if(c(539, 490, 0x40A4F0)){
		;Surprise bundle
		if (c(674, 737, 0xEDE7C6) && c(687, 734, 0xE16AEE)) ;Surprise bundle
		||(c(705, 694, 0x152636) && c(663, 728, 0xEB4E7D)) ;Pre-register bundler
		||(c(705, 694, 0x152636) && c(646, 746, 0x113B23)) ;Small emblem pack
		||(c(703, 696, 0x152636) && c(688, 743, 0xB57C52)) ;Hero Trial Pack
		||(c(703, 696, 0x152636) && c(690, 724, 0x233B4A)) ;Lucky Common Emblem Chest
		||(c(703, 696, 0x152636) && c(690, 721, 0x5A2A2E)) ;Limited Emblem Chest
		||(c(703, 696, 0x152636) && c(677, 725, 0x3B9334)) ;Epic Skin Trial Card
			click(1370, 765)
		;Deluxe Skin Trial Card Pack
		if(c(702, 699, 0x152636))
			clickWhen(671, 755, 0x9ECAD2, 1370, 765)
		;Daily Skin Trial Card Pack
		if(c(671, 755, 0x91C3C9))
			clickWhen(678, 740, 0x95E9D0, 1370, 765)
		;Assassin Skin Trial Card Bundle
		if(c(677, 733, 0x311864))
			clickWhen(649, 723, 0xA542D3, 1370, 765)
		;Daily Supply
		if(c(702, 696, 0x152636))
			clickWhen(681, 736, 0xC712C8, 1370, 765)
		;Little Commander Skin
		if(c(701, 699, 0x152636))
			clickWhen(695, 741, 0x6F2495, 1370, 765)
		;Little Commander Trial pack
		if(c(661, 753, 0xE9A70A))
			clickWhen(650, 744, 0xBD3636, 1370, 765)
		;Little Commander Trial pack 1 day
		if(c(629, 697, 0x172738))
			clickWhen(663, 756, 0xE9A70A, 1370, 765)
		;Flare up chest
		if(c(665, 723, 0xA0C9E1))
			clickWhen(699, 717, 0x7BABC6, 1370, 765)
		;Normal emblem pack
		if(c(646, 747, 0x0A335C))
			clickWhen(664, 725, 0x3349A4, 1370, 765)
		;Lucky skin chest
		if(c(664, 719, 0x7A2DB3))
			clickWhen(695, 721, 0xD2C597, 1370, 765)
		;Lucky skin chest
		if(c(675, 706, 0x558DDB))
			clickWhen(681, 754, 0x3529A2, 1370, 765)
		;Skin fragment bundle
		if(c(678, 712, 0xFFFC9C))
			clickWhen(678, 748, 0xD6AD68, 1370, 765)
		;Diamond Hero Trial Card
		if(c(675, 756, 0xB47C53))
			clickWhen(687, 735, 0xC48A61, 1370, 765)
		;Pre-Update Event Chest
		if(c(663, 724, 0xEDAB56))
			clickWhen(685, 721, 0xFC62FF, 1370, 765)
		;Marksman Skin Trial Card
		if(c(652, 722, 0xF49F62))
			clickWhen(673, 737, 0x512C15, 1370, 765)
		;Weekly sign-in bundle
		if(c(704, 701, 0x1D2542))
			clickWhen(686, 735, 0xDC68EC, 1370, 765)
		;If video chest selected, pick next chest
		if(c(660, 757, 0xBA9C73) && c(673, 722, 0xF2E5C1)){
			click(750, 357)
		}
		;If BB Coin selected, pick next chest
		if(c(694, 740, 0xEED767) && c(650, 758, 0xA07714)){
			click(877, 356)
		}
		return true
	}
	;In quantity use dialog
	if(c(821, 608, 0x3E7891) && c(874, 595, 0x13273F) && c(1153, 599, 0x38728B)){
		;Surprise bundle
		if (c(786, 481, 0xE8E6C4) && c(801, 478, 0xD95FE9))
		|| (c(803, 465, 0x562729) && c(757, 485, 0xFC4545))
		|| (c(792, 491, 0x235A2D) && c(789, 466, 0x469F3B)) ;Epic skin trial card pack
			maxOutAndUseInventory()

		;Deluxe Skin Trial Card Pack
		if(c(785, 497, 0x98C7CF) && c(805, 494, 0x4796A7)){
			maxOutAndUseInventory()
		return true
		}
		;Deluxe Skin Trial Card Pack Purple
		if(c(785, 497, 0x98C7CF) && c(800, 477, 0xA4CDE5)){
			maxOutAndUseInventory()
		return true
		}
		;Daily Skin Trial Card Pack
		if(c(785, 495, 0x9EC9D2) && c(803, 494, 0x4799A7)){
			maxOutAndUseInventory()
		return true
		}
		;Hero Trial Pack
		if(c(801, 483, 0xB87F55) && c(777, 500, 0x4F2C3C)){
			maxOutAndUseInventory()
		return true
		}
		;Small emblem pack
		if(c(760, 487, 0x123B23) && c(776, 470, 0x1B622D)){
			maxOutAndUseInventory()
		return true
		}
		;Daily supply
		if(c(805, 471, 0xC48F36) && c(775, 502, 0xAC7541)){
			maxOutAndUseInventory()
		return true
		}
		;Limited Emblem Chest
		if(c(774, 487, 0xE63B33) && c(800, 482, 0x83453C)){
			maxOutAndUseInventory()
		return true
		}
		;Normal emblem pack
		if(c(759, 489, 0x0A325B) && c(764, 466, 0x072D56)){
			maxOutAndUseInventory()
		return true
		}
		;Lucky Skin Chest
		if(c(776, 461, 0x8232BA) && c(810, 461, 0xEEE6CD)){
			maxOutAndUseInventory()
			return true
		}
		;Marksman Skin Trial Card
		if(c(789, 479, 0x4D2913) && c(790, 449, 0xAF7D4F)){
			maxOutAndUseInventory()
			return true
		}
		;Little commander trial pack 1 day
		if c(762, 490, 0xBB372F) && c(774, 503, 0xE9A710) {
			maxOutAndUseInventory()
			return true
		}
		;Skin Trial Pack
		if c(799, 481, 0xAEE8DF) && c(804, 493, 0x4A9EA3) {
			maxOutAndUseInventory()
			return true
		}
		return true
	}
	return false
}
maxOutAndUseInventory(){
	click(1119, 595)
	click(959, 675)
}
clickAndSaveWindow(x, y){
	saveLastWindow()
	MouseGetPos px, py
	Click 965, 764
	MouseMove px, py
	focusLastWindow()
}
escape(){
	saveLastWindow()
	focusAppWindow()
	if WinActive("BlueStacks")
		Send {esc}
	focusLastWindow()
}

focusAppWindow(){
	WinActivate BlueStacks
}
waitAndEscape(){
	Sleep 21000
	escape()
}

backAndUnmute(){
	escape()
}

finishTexting(){
	click(1408, 1022)
	Sleep 100
}
inDraftPick(){
	return c(652, 819, 0x29507B)
}
inClassicPick(){
	return c(1012, 822, 0x28527F)
}
inLobby() { 
	return c(468, 811, 0x1F466D) 
}
inFriendChat() { 
	return c(586, 467, 0x479FF8) 
}
inChat() { 
	return c(536, 808, 0x73C5F8) 
}
chatDrag(x, y){
	if(c(1467, 118, 0xE8B4B4)){
		quickChatDrag(1472, 177, x, y)
	}
}
iconDrag(x, y){
	if(c(1467, 213, 0x9ECDE2)) {
		quickChatDrag(1469, 222, x, y)
	}
}
quickChatDrag(xfirst, yfirst, x, y){
	shouldClickRight:=false
	If GetKeyState("RButton","D")		
		shouldClickRight:=true
	untapButtons()

	MouseGetPos cx, cy
	MouseMove %xfirst%, %yfirst%
	Click, Down
	Sleep 15
	xdrag:=xfirst-25
	MouseMove %xdrag%, %yfirst%
	Sleep 15
	MouseMove %x%, %y%
	Sleep 175
	Click, Up

	MouseMove %cx%, %cy%

	if(shouldClickRight)
		Click, down, right
}
buyBasicItem(){
	click(544, 344)
	;Shoes
	clickWait(490, 620, 0x357BCB)
	click(1153, 454)
	buy()

	;Physical defense
	clickWait(484, 555, 0x3779CB)
	if(!c(1073, 442, 0x9D3E1D))
		clickWait(925, 250, 0xEEDBC5)
	click(1074, 457)
	pixelWait(1066, 419, 0xFEFEFF)
	buy()

	;Magical defense
	clickWait(873, 258, 0xE0A777)
	click(1309, 452)
	buy()

	;HP
	clickWait(816, 259, 0xD0AE76)
	waitClick(1065, 551, 0x369115)
	buy()

	;Magic
	clickWait(542, 497, 0x41AAED)
	click(1060, 455)
	pixelWait(1067, 418, 0xFFFFFF)
	buy()

	;Attack
	clickWait(533, 431, 0x459DF6)
	click(1028, 555)
	buy()
}
buy(){
	click(1333, 816)
	Sleep 75
}
sellAllItem(){
	if(!c(589, 802, 0x000000)){
		click(589, 797)
		sell()
		pixelWait(589, 797, 0x000000)
	}
	if(!c(661, 798, 0x000000)){
		click(654, 796)
		sell()
		pixelWait(661, 798, 0x000000)
	}
	if(!c(731, 796, 0x000000)){
		click(729, 795)
		sell()
		pixelWait(731, 796, 0x000000)
	}
	if(!c(792, 798, 0x000000)){
		click(795, 798)
		sell()
		pixelWait(792, 798, 0x000000)
	}
	if(!c(863, 802, 0x000000)){
		click(860, 801)
		sell()
		pixelWait(863, 802, 0x000000)
	}
	if(!c(930, 799, 0x000000)){
		click(934, 798)
		sell()
		pixelWait(930, 799, 0x000000)
	}
}
sell(){
	pixelWait(1317, 816, 0xAC4B55)
	click(1317, 816)
}
quickChatStreamer(x, y){
	click(796, 1064)
	pixelWait(1322, 414, 0x7CCCFF)
	click(x, y)
}

commendEveryone(){
	commended := false
	;Loop 2{
		if(c(441, 710, 0x2D5E91)){
			click(447, 718)
			commended := true
		}
		if(c(446, 651, 0x7DE8FE)){
			click(445, 649)
			commended := true
		}
		if(c(456, 562, 0x2C5E90)){
			click(446, 572)
			commended := true
		}
		if(c(456, 489, 0x2E5F91)){
			click(447, 497)
			commended := true
		}
		if(c(449, 426, 0x7BDBFE)){
			click(446, 427)
			commended := true
		}
	;}

	if(commended) {
		click(561, 426)
		click(1357, 425)
	}
}

follow(){
	if(c(612, 404, 0xBF5A8C) && c(495, 424, 0x2E68A2)) ;1
		click(496, 422)
	if(c(613, 481, 0xE55996) && c(494, 499, 0x2F6AA4)) ;2
		click(496, 494)
	if(c(613, 555, 0xE55A96) && c(495, 573, 0x2F69A3)) ;3
		click(496, 567)
	if(c(613, 629, 0xE25A95) && c(496, 648, 0x2F6DA7)) ;4
		click(496, 639)
	if c(613, 703, 0xE55B97) && c(495, 721, 0x2F6AA3) ;5
		click(496, 715)
	if(c(1305, 407, 0xE35793) && !c(1422, 424, 0x5C5370)){ ;6
		click(1421, 430)
		Sleep 100
		click(1472, 425)
		Sleep 100
	}
	if(c(1305, 480, 0xE35D97) && !c(1423, 497, 0x615574)){ ;7
		click(1423, 496)
		Sleep 100
		click(1468, 492)
		Sleep 100
	}
	if(c(1305, 555, 0xE55793) && !c(1423, 573, 0x5D506F)){ ;8
		click(1424, 569)
		Sleep 100
		click(1465, 570)
		Sleep 100
	}
	if(c(1305, 629, 0xE45693) && !c(1422, 647, 0x5C506D)) { ;9
		click(1422, 644)
		Sleep 100
		click(1472, 646)
		Sleep 100
	}
	if(c(1305, 703, 0xE55B96) && !c(1423, 722, 0x5A4F6D)) { ;10
		click(1420, 716)
		Sleep 100
		click(1464, 718)
		Sleep 100
	}
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
openShop(){
	click(1465, 23) ;Click shop
	pixelWait(436, 802, 0x26486E)
}
ignoreInvite(){
	click(837, 687)
	click(844, 624)
	pixelWait(959, 696, 0x25609A)
	click(772, 618)
	click(955, 675)
}