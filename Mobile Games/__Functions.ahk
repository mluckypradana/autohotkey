#Include D:\Other\Hotkeys\___Functions.ahk

back(){
	waitClick(463, 248, 0xFFE1AE)
}
forceBack(){
	click(463, 248)
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
	if WinActive("ahk_exe HD-Player.exe")
		Send {esc}
	focusLastWindow()
	Sleep 100
}

focusAppWindow(){
	WinActivate ahk_exe HD-Player.exe
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
		quickChatDrag(1470, 179, x, y)
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

	drag(xfirst, yfirst, x, y)

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
	click(814, 1068)
	pixelWait(1312, 426, 0xFBFCFD)
	click(x, y)
}

commendEveryone(){
	commended := false
	;Loop 2{
		if(c(448, 725, 0x7BE6FE)){
			click(447, 718)
			commended := true
		}
		if(c(451, 650, 0x7BE3FE)){
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
	if c(607, 405, 0x8F57AA) || c(612, 401, 0x925BAF) ;1
		click(496, 422)
	if c(606, 482, 0x9058AA) || c(612, 474, 0x935CB0) ;2
		click(496, 494)
	if c(607, 554, 0x9159AB) || c(613, 549, 0x975FB1) ;3
		click(496, 567)
	if c(613, 622, 0x9A5EAF) || c(613, 622, 0x9459AA) ;4
		click(496, 639)
	if c(613, 697, 0x9058A9) || c(613, 697, 0x945CAE) ;5
		click(496, 715)
	if c(1305, 408, 0xF9B0F2) || c(1306, 398, 0xA153A4) || c(1307, 400, 0xA356A8){ ;6
		click(1421, 430)
		Sleep 50
		click(1472, 425)
		Sleep 50
	}
	if c(1306, 474, 0xA153A3) || c(1306, 474, 0xA457A9){ ;7
		click(1423, 496)
		Sleep 100
		click(1468, 492)
		Sleep 100
	}
	if c(1305, 555, 0xF9B0F3) || c(1307, 548, 0xA254A3) || c(1306, 549, 0xA659A9){ ;8
		click(1424, 569)
		Sleep 50
		click(1465, 570)
		Sleep 50
	}
	if c(1305, 622, 0xA455A4) || c(1307, 623, 0xA85CAB) { ;9
		click(1422, 644)
		Sleep 50
		click(1472, 646)
		Sleep 50
	}
	if c(1305, 704, 0xF8AFF2) || c(1307, 697, 0xA658A7) || c(1306, 696, 0xA254A2) { ;10
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
	pixelWait(444, 298, 0xFAE327)
}
ignoreInvite(){
	clickWhen(835, 684, 0x283F59, 0, 0)
	clickWhen(788, 640, 0x5C8DCC, 0, 0)
	pixelWait(892, 676, 0x4B6692)
	clickWhen(769, 605, 0x263D57, 0, 0)
	clickWhen(900, 678, 0x4D6896, 0, 0)
}
inMainMenu(){
	return c(1480, 252, 0x00FF00)  && c(1449, 827, 0xEFFBFE)
}
openGameGuardian(){
	waitClick(1139, 77, 0x8900C3)
}

quickChat(x, y){
	if !allowChat() 
		return
	Send {F4}
	Sleep 30
	click(1217, 92) ;Chat
	Sleep 25
	click(x, y) ;Wait
}
quickIcon(x, y){
	if !allowChat() 
		return
	Send {F4}
	Sleep 30
	click(1225, 150) ;Icon
	pixelWait(1235, 156, 0x99CCE1)
	click(x, y) ;Wait
}
allowChat(){
	return c(1470, 214, 0x9CCBE1)
}