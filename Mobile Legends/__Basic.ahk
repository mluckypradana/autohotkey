global assistEnabled:=true
global mockingEnabled:=false
global hasEnemy:=false
#InstallKeybdHook
#InstallMouseHook

#Include ../___Basic.ahk
#IfWinActive BlueStacks
;!s::Suspend


#1::
	Msgbox,
	(LTrim
		mluckypradana@gmail.com | januariMoonton
		luckypradana32@gmail.com
		venmupsg@gmail.com
		ron88idn@gmail.com | idron88123
		maleskuliahid@gmail.com | jujuku11
		iqueue4@gmail.com
		dev.segarmart@gmail.com | S@cret123
		mluckypradana2@gmail.com | jGmail1!
		yopopay19@gmail.com | yopopay@123

		Unused
		ren2goapps@gmail.com | ren2go@123
		wbti.apps@gmail.com | qwerty@1

		bgsprg@gmail.com | Gembl0n9302
		ainkregea@yahoo.com | mamahsob (Facebook)
	)
		
Return
!c::
	follow()
	Sleep 100
	commendEveryone()
Return

!+c::
	follow()
Return
;Chat streamer
^r::
	Random, rand, 1, 9
	Switch rand {
		case 1:
    			Send Beautiful kill {!}
		case 2:
    			Send Amazing {!}
		case 3:
    			Send Excellent controls {!}
		case 4:
    			Send Hilarious {!}
		case 5:
    			Send Strength speaks
		case 6:
    			Send Don't flinch. Gank {!}
		case 7:
    			Send Savage{!} Perfect {!}
		case 8:
    			Send Max score to this team fight
		default:
			Send Nice
	}
	Send !{r}
Return
;Watch ads
!'::
	assistEnabled:=false
	SoundBeep 350, 100
Return
!/::
	assistEnabled:=true
	SoundBeep 350, 100
	while(assistEnabled){	
		;Close fake serial number idm
		if(isColor(764, 537, 0xFCE100) && isColor(755, 521, 0x000000)){
			click(1149, 621)
		}
		;Close fake serial number idm shorter message
		if(isColor(763, 542, 0xFCE100) && isColor(718, 471, 0x579E83)){
			click(1158, 615)
		}
		
		if(clickWhen(616, 344, 0xC54154, 0, 0))
			Continue ;Claim gold chest
		if(clickWhen(614, 449, 0xBA3A4C, 0, 0)) 
			Continue ;Claim free chest	
		if(clickWhen(611, 536, 0xD55A68, 0, 0))
			Continue ;Go to daily chest
		if(clickWhen(1142, 806, 0x8E8E82, 1220, 801))
			Continue ;Claim starlight
	
		if(isColor(675, 695, 0xFCEE66)){		
			if(clickWhen(1452, 265, 0xA4805B, 1452, 265))
				Continue ;Claim daily reward
			;Claim daily reward coin 1
			if(isColor(718, 726, 0xCC4B5C))
				click(718, 726)
			;Claim daily reward coin 2
			clickWhen(834, 727, 0xBC3B4E, 0, 0)
			;Claim daily reward coin 3
			clickWhen(948, 727, 0xBC3B4E, 0, 0)
			;Claim daily reward coin 4
			clickWhen(1061, 726, 0xC64155, 0, 0)
			;Claim weekly blue treasure
			clickWhen(1248, 746, 0xB53648, 0, 0)
			;CLaim weekly purple treasure
			clickWhen(1418, 744, 0xE06E79, 0, 0)
		}
				 

		;Claim reward
		if(isColor(685, 344, 0x7A7A6B)&&isColor(1049, 759, 0xA8825C)){
			Send {Esc}
			Sleep 100
		}
		;Claim usable reward
		if(isColor(687, 344, 0x787C71)&&isColor(1247, 342, 0x797A6C)){
			Send {Esc}
			Sleep 100
		}
		;Claim bigger useable reward
		if(iscolor(685, 342, 0x7A7A6B) && isColor(1247, 344, 0x7A7A6C)){
			Send {Esc}
			Sleep 100
		}
		;Is in celestial page
		if(isColor(1259, 621, 0xBD42D3)){
			;Claim celestial reward 1
			clickWhen(965, 431, 0xA07D5A, 0, 0)
			;Claim celestial reward 2
			clickWhen(966, 538, 0xA07D5A, 0, 0)
			;Claim celestial reward 3
			clickWhen(966, 664, 0xA6815C, 0, 0)

			;Claim celestial reward 4
			clickWhen(965, 750, 0xA07D5A, 0, 0)
			
		}
		;Claim celestial reward
		if(isColor(686, 340, 0x7B7E72)&&isColor(1049, 748, 0xA47F5B))
			Send {Esc}
		;Like profile
		if(isColor(1221, 337, 0x4F4F4F)&&isColor(1442, 621, 0x284071))
			click(1440, 620)
		;Claim All MC reward
		if(isColor(1300, 360, 0xAB8457) && isColor(1214, 821, 0x25629C))
			click(1214, 821)
		;Claim All starlight member star
		if(isColor(1472, 359, 0x8C91DF) && isColor(1444, 825, 0xA8976E))
			click(1444, 825)
		;Skip animation preparation
		if(isColor(1170, 790, 0xDFA31F) && isColor(1327, 316, 0x161C25))
			click(1327, 316)
		;Skip animation Lucky Spin
		if(isColor(583, 813, 0xBAF0F4) && !isColor(1303, 780, 0x38CCFF))
			click(1302, 782)
		;Skip animation aurora summon
		if(isColor(1273, 805, 0xB366FF)){
			clickWhen(588, 801, 0x161831, 0, 0)
			clickWhen(1457, 745, 0xC94457, 1429, 783)
		}
		;Skip animation Zodiac summon
		if(isColor(1346, 745, 0x587CF5) && isColor(578, 751, 0x081626))
			click(578, 751)
		;Skip animation magic wheel
		if(isColor(1323, 811, 0x21C3E4) && isColor(578, 321, 0x0C2237))
			click(579, 318)
		;Check apprentice or mentor profile
		if(isColor(1283, 262, 0x37C6F9) && isColor(1088, 671, 0x2386AA))
			click(1088, 671)
		;Open MC magic competition
		if(isColor(445, 816, 0xD4FFFF) && isColor(516, 636, 0xBC3A4D))
			click(516, 636)
		;Claim all daily reward chest
		if(isColor(907, 254, 0x4E5C98) && isColor(1413, 320, 0xA9825C))
			click(1356, 318)
		;Claim MC coin
		if(isColor(1152, 351, 0xFAEA76) && isColor(524, 328, 0xE8CA7D))
			click(490, 348)
		;Click daily ad
		if(isColor(951, 284, 0xA1A085) && isColor(1292, 609, 0xBA394C))
			click(1292, 609)
		;Click daily supply Free button
		if(isColor(794, 460, 0xB807C7) && isColor(921, 705, 0xBB8D61))
			click(921, 705)
		;Click daily ad progress start button
		if(isColor(1354, 317, 0x7CCEFF) && isColor(1135, 663, 0xD89152))
			click(956, 746)
		;Click daily ad start button
		if(isColor(686, 350, 0x787A6C) && isColor(896, 752, 0x925368))
			click(896, 752)
		;Click Ad Reward watch button
		if(isColor(1136, 656, 0xAF6A65) && isColor(965, 764, 0xDCA16A))
			click(965, 764)
		;Claim daily ad reward
		if(isColor(686, 351, 0x7B7A6D) && isColor(827, 685, 0x102034) && isColor(1040, 767, 0xA7825C))
			Send {Esc}
		;Claim closable daily ad reward
		if(isColor(686, 350, 0x7C7B6C) && isColor(1039, 763, 0xA8825C) && isColor(1448, 358, 0x7DCCFF))
			click(1448, 358)

		;Back from whatsapp
		if(isColor(1063, 33, 0x999999) && isColor(1223, 854, 0x00CC3F))
			Send {Esc}

		;In Shop
		if(isColor(1398, 324, 0x7BC9FF)){
			;In daily supply
			if(isColor(932, 802, 0x2A4C73) && isColor(678, 415, 0xFDDCC4)){
				clickWhen(1345, 478, 0xDCA16A, 0, 0)
				clickWhen(1414, 588, 0xA7815C, 0, 0)
			}
		}

		;In event
		;In Weekly benefits
		if(isColor(767, 701, 0xE2534C) && isColor(1418, 701, 0xE8524F)){
			clickWhen(1168, 792, 0xF1C875, 0, 0)
			;3
			clickWhen(1386, 792, 0xEFC673, 0, 0)
		}
	
		;Claim 7-day login reward
		if(isColor(1374, 301, 0x687792) && (isColor(1378, 724, 0xDFAB72)||isColor(1363, 736, 0xAB835D)))
			click(1379, 750)
		
		;Close exit game dialog
		if(isColor(1148, 753, 0xD8565E) && isColor(781, 754, 0x248BB1))
			click(787, 751)
		
		;Claim BP in inbox
		if(isColor(1132, 760, 0xE7D981) && isColor(1334, 766, 0xAA835D))
			click(1335, 771)

		;Ad - Close ad when playstore prompt show up
		if(isColor(1475, 696, 0x202124)){
			if(isColor(1419, 592, 0x00A173)||isColor(487, 100, 0x00D6FF)||isColor(490, 100, 0x00D4FF))
				Send {Esc}
			;Ad - CLose ad when playstore prompt show up big
			if(isColor(484, 96, 0x00D5FF) || isColor(487, 95, 0x00D3FF))
				Send {Esc}
		}
		
	}
Return

!+d::	
	;Claim chess
Return

;Zoom camera
!q::
	click(631, 52)
	Sleep 50
	click(814, 441)
	click(485, 34)
Return

;Zoom out camera
!e::
	click(631, 52)
	Sleep 50
	click(921, 437)
	click(485, 34)
Return

;Ignore invite
!a::
	click(839, 683)
	click(841, 610)
	Sleep 300
	click(772, 618)
	click(955, 675)
Return

;Buy roam item
!f::
	click(1464, 24)
	Sleep 100
	click(485, 722)
	Sleep 100
	click(810, 326)
	Sleep 100
	click(1233, 542)
	Sleep 100
	click(1377, 821)
	Sleep 100
	click(484, 345)
	Sleep 100
	click(1462, 271)
Return



;Prioritize mana
!g::
	click(1465, 23) ;Click shop
	Sleep 50
	click(485, 409) ;Click attack
	Sleep 50
	click(604, 710) ;Click endless battle
	Sleep 50
	click(1386, 439) ;Click Azure blade
	click(1400, 359) ;Prioritize
	click(1461, 267) ;Close
Return

;Closest target
!d::
	click(635, 54) ;Click setting
	;Sleep 200
	click(537, 408) ;Click control setting
	Sleep 100
	click(1199, 693) ;Click closest target
	click(1408, 296) ;Click close
Return


;Lowest HP
!s::
	click(635, 54) ;Click setting
	click(537, 408) ;Click control setting
	Sleep 100
	click(956, 693) ;Click lowest HP
	click(1408, 296) ;Click close
Return

;Reply
!r::
	;In general chat
	if(clickWhen(503, 754, 0x307BC8, 0, 0))
		Return
	;In profile dialog
	if(clickWhen(829, 582, 0x9CADD5, 0, 0))
		Return
	
	if(inLobby()){
		click(705, 812)
		return
	}
	;In lobby chat
	if(inChat() && !isColor(436, 970, 0xFFFFFF)){
		click(880, 803)
		return
	}
	;When texting
	if(isColor(436, 970, 0xFFFFFF))
		finishTexting()
	
	;Send when texting
	if(inFriendChat())
		click(1220, 797)
	if(inChat())
		click(1213, 797)
	if(inClassicPick())
		click(1012, 822)
	if(inDraftPick())
		click(652, 819)
Return

Numpad4::
	Msgbox haha
Return

finishTexting(){
	click(1408, 1022)
	Sleep 200
}
inDraftPick(){
	return isColor(652, 819, 0x29507B)
}
inClassicPick(){
	return isColor(1012, 822, 0x28527F)
}
inLobby() { 
	return isColor(468, 811, 0x1F466D) 
}
inFriendChat() { 
	return isColor(586, 467, 0x479FF8) 
}
inChat() { 
	return isColor(536, 808, 0x73C5F8) 
}


!Enter::
	if(isColor(1463, 991, 0xFFFFFF)){
		click(1195, 803)
		Sleep 200
	}
	clickWhen(1127, 800, 0x192C46, 1249, 801)
Return

;Mute
!m::
	click(956, 18)
	Sleep 100
	click(447, 302)
	click(1474, 298)
	Sleep 100
	click(1474, 258)
Return

^!1::
	click(686, 593)
	Sleep 1000
	click(701, 786)	
	Sleep 300
	click(484, 263)
	Sleep 500
	click(484, 263)
Return

^!2::
	click(908, 595)
	Sleep 1000
	click(701, 786)
	Sleep 100
	click(484, 263)
	Sleep 500
	click(484, 263)
Return

!1::
	quickChatDrag(1413, 444)
Return
!2::
	quickChatDrag(1274, 342)
Return
!3::
	quickChatDrag(1340, 178)
Return
!4::
	quickChatDrag(1367, 91)
Return
!5::
	quickChatDrag(1452, 36)
Return
!t::
	thumbsUp()
Return
^1::
	quickChatStreamer(1087, 447)
Return
^2::
	quickChatStreamer(1079, 498)
Return
^3::
	quickChatStreamer(1065, 540)
Return
^4::
	quickChatStreamer(1048, 586)
Return
^5::
	quickChatStreamer(1055, 638)
Return
^6::
	quickChatStreamer(1050, 685)
Return
^s::
	takeScreenshot()
Return
;Sell all item
!+^r::
	click(1462, 27)
	Sleep 90
	sellAllItem()
	buyBasicItem()
	click(1461, 273)
Return
!z::
	click(428, 292)
	Sleep 100
	click(673, 274)
Return
!x::
	click(428, 292)
	Sleep 100
	click(807, 277)
Return
;Scroll
!o::
	MouseGetPos x, y
	MouseMove 610, 739
	SetMouseDelay 20
	MouseClickDrag, Left, 610, 739, 667, 278
	SetMouseDelay -1
	MouseMove x, y
Return
;Change controller
!n::
	Send {F11}
	Sleep 400
	click(1878, 331)
	MouseMove 1669, 651
	Sleep 2000
	Send {F11}
Return
;Execute script
!u::
	if(isColor(1409, 498, 0x424242)){
		click(1438, 574)
		Sleep 200
	}
	click(1343, 221)
	Sleep 100
	click(1354, 803)
Return

#IfWinActive
buyBasicItem(){
	;Roam
	click(484, 717)
	Sleep 100
	click(1226, 547)
	buy()
	;Shoes
	click(481, 587)
	Sleep 90
	click(1155, 447)
	buy()
	;Attack
	click(483, 408)
	Sleep 90
	click(1109, 544)
	buy()
	;Defense
	click(484, 535)
	Sleep 90
	click(1068, 448)
	buy()
	click(811, 423)
	Sleep 90
	click(1315, 456)
	buy()
	click(485, 473)
	Sleep 90
	click(1064, 452)
	buy()
}
buy(){
	Sleep 90
	click(1333, 816)
	Sleep 90
}
sellAllItem(){
	click(592, 803)	
	buy()
	click(653, 797)
	buy()
	click(728, 798)
	buy()
	click(796, 800)
	buy()
	click(867, 802)
	buy()
	click(929, 800)
	buy()
}

quickChatStreamer(x, y){
	click(796, 1064)
	Sleep 200
	click(x, y)
}

thumbsUp(){
	if(isColor(1467, 213, 0x9ECDE2)) {
		shouldClickRight:=false
		If GetKeyState("RButton","D")		
			shouldClickRight:=true

		Click, up, right
		MouseGetPos cx, cy
		MouseMove 1469, 222
		Click, Down
		Sleep 100
		MouseMove 1427, 69
		Sleep 51
		Click, Up


		MouseMove %cx%, %cy%
			
		if(shouldClickRight)
			Click, down, right
	}
}

quickChatDrag(x, y){
	if(isColor(1467, 118, 0xE8B4B4)){
		shouldClickRight:=false
		If GetKeyState("RButton","D")		
			shouldClickRight:=true

		Click, up, right
		MouseGetPos cx, cy
		MouseMove 1467, 118
		;SetMouseDelay 25
		;MouseClickDrag, Left, 1467 ,118, %x%, %y%
		;SetMouseDelay -1
		

		Click, Down
		Sleep 100
		MouseMove %x%, %y%
		Sleep 51
		Click, Up

		MouseMove %cx%, %cy%

		if(shouldClickRight)
			Click, down, right
	}
}

commendEveryone(){
	Loop 2{
		click(449,432)
		click(449,716)
		click(449,501)
		click(449,648)
		click(449,576)
	}
	click(561, 426)
	click(1357, 425)
}

follow(){
	;1
	clickWhen(613, 407, 0xB74E86, 496, 422)
	;2 
	clickWhen(613, 480, 0xBF4E83, 496, 494)
	;3
	clickWhen(613, 555, 0xD1538D, 496, 567)
	;4
	clickWhen(612, 628, 0xB54E82, 496, 639)
	;5
	clickWhen(613, 703, 0xDE5691, 496, 715)
	;6
	if(clickWhen(1306, 406, 0xD05289, 1421, 430)||clickWhen(1307, 407, 0xD8518C, 1421, 430))
		click(1462, 420)
	;7
	if(clickWhen(1305, 481, 0xDA528C, 1423, 496)||clickWhen(1306, 479, 0xCD4F86, 1423, 496)||clickWhen(1306, 478, 0xD95690, 1423, 496))
		click(1463, 489)
	;8 (Done)
	if(clickWhen(1306, 555, 0xD9538C, 1424, 569))
		click(1460, 565)
	;9 
	if(clickWhen(1306, 629, 0xE25792, 1422, 641))
		click(1461, 637)
	;10
	if(clickWhen(1305, 702, 0x7F3254, 1420, 716))
		click(1463, 711)
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