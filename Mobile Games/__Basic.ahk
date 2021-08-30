#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1
#Include __Functions.ahk

>!\::ExitApp
>!/::
	;Debug
	drag(1093, 393, 1079, 805)
Return

;Disable assist
>!>+,::
	closeThreads(2, "_Thread")
	closeThread("_Benedetta")
	tooltip("Assist stopped")
Return
;Assist
>!,::
	runThreads(2, "_Thread")
	runThread("_Benedetta")
	tooltip("Assist started")
Return
;Thumbs up apprentice
>!;::
	thumbsUpEnabled:=true
	beep()
	while(thumbsUpEnabled){	
		if(c(921, 657, 0x112742) && c(830, 583, 0x99AAD3)){
			click(1083, 660) ;Check
			pixelWaitTime(1176, 324, 0x3C3C3C, 5000)
			;Like
			click(1440, 621)
			click(1440, 621)
			escape()
		}
	}
Return
>!>+;::
	thumbsUpEnabled:=false
	beep()
Return

;Use bundle inventory
>!'::
	useChestEnabled:=true
	beep()
	while(useChestEnabled){	
		useBundleInventory()
	}
Return
>!>+'::
	useChestEnabled:=false
	beep()
Return

>!>+e::
	ad:=0
Return
>!e::
	ad:=1
	tooltip("Ad click started")
	while(ad==1){
		clickAd()
	}
Return
clickAd(){
	if(c(557, 261, 0xE7C893) && c(600, 264, 0xF4CC91)){
		clickWhen(1293, 610, 0xB63648, 0, 0) ;Click daily ad
		if(clickWhen(1291, 610, 0xB63749, 0, 0)) ;Click daily supply Free button
		clickWhen(1396, 652, 0xB9394B, 0, 0) ;Click grand collection free chest
	}
	clickWhen(794, 464, 0xCC16C6, 1037, 704) ;Click daily supply start Free button
	clickWhen(973, 542, 0xD21ACF, 1142, 747) ;Click daily supply watch videos
	;Click daily ad progress start button
	if(c(1354, 317, 0x7CCEFF) && c(1135, 663, 0xD89152))
		click(956, 746)
	;Click daily ad start button
	if(c(686, 350, 0x787A6C) && c(896, 752, 0x925368))
		click(896, 752)
	;Click Ad Reward watch button
	if(c(1136, 643, 0xFDF9BB) && c(923, 746, 0xB88C60)){
		clickAndSaveWindow(965, 764)
		;waitAndEscape()
	}
}
#IfWinActive BlueStacks
>!Esc::
	Msgbox,
	(LTrim
		This is a free message
	)
Return
;Zoom camera
!F1::
	click(631, 52)
	Sleep 50
	click(814, 441)
	click(485, 34)
Return
;Zoom out camera
!+F1::
	click(631, 52)
	Sleep 50
	click(921, 437)
	click(485, 34)
Return

!F2::
	;If in game
	if(c(633, 42, 0xADC1DC)){
		clickWhen(632, 41, 0xADC1DA, 0, 0)
		pixelWait(587, 533, 0x162F4C)
		click(560, 524)
		pixelWait(892, 534, 0x234586)
		click(1092, 468)
		escape()
	}
	else {
		clickWhen(1388, 243, 0xB1C5DE, 0, 0)
		pixelWait(531, 592, 0x123B63)
		click(528, 591)
		pixelWait(883, 531, 0x234585)
		click(1105, 461)
		escape()
	}
Return
!+F2::
	if(c(633, 42, 0xADC1DC)){
		clickWhen(632, 41, 0xADC1DA, 0, 0)
		pixelWait(587, 533, 0x162F4C)
		click(560, 524)
		pixelWait(892, 534, 0x234586)
		click(890, 469)
		escape()
	}
	else {
		clickWhen(1388, 243, 0xB1C5DE, 0, 0)
		pixelWait(531, 592, 0x123B63)
		click(528, 591)
		pixelWait(883, 531, 0x234585)
		click(881, 466)
		escape()
	}
Return
;Change controller
!F3::
	untapButtons()
	if c(1698, 22, 0x232642) {
		Send {F11}
		return
	}
	Send {F11}
	pixelWait(1905, 655, 0x232642)
	if clickWhen(1905, 655, 0x232642, 1903, 179){
		waitClick(1836, 312, 0x1B1E38)
		MouseMove 1797, 239
		Sleep 1000
		pixelWait(1823, 292, 0x2B2E4C)
		if c(1817, 287, 0x2B2E4C)
			Send {F11}
	}
Return
;AFK Teammate
!`::
	clickWhen(445, 292, 0x8DAAC7, 0, 0)
	pixelWait(752, 279, 0xA9835C)
	click(752, 279)
Return
;AFK Teammate stay at base
!+`::
	clickWhen(445, 292, 0x8DAAC7, 0, 0)
	pixelWait(752, 279, 0xA9835C)
	click(700, 279)
Return
!1::quickChatStreamer(1019, 445)
!2::quickChatStreamer(1050, 492)
!3::quickChatStreamer(1046, 545)
!4::quickChatStreamer(1032, 586)
!5::quickChatStreamer(1023, 635)
!6::quickChatStreamer(1011, 688)
!q::chatDrag(1441, 348)
!w::chatDrag(1274, 342)
!e::chatDrag(1385, 181)
!r::chatDrag(1363, 80)
!t::chatDrag(1472, 67)
!+q::iconDrag(1364, 181)
!+w::iconDrag(1369, 277)
!+e::iconDrag(1440, 353)
;Change target Lowest HP
!a::
	click(635, 54) ;Click setting
	pixelWait(594, 416, 0x152A44)
	click(537, 408) ;Click control setting
	pixelWait(599, 421, 0x4A9DF7)
	click(956, 693) ;Click lowest HP
	escape()
Return
;Closest target
!+a::
	click(635, 54) ;Click setting
	pixelWait(594, 416, 0x152A44)
	click(537, 408) ;Click control setting
	pixelWait(599, 421, 0x4A9DF7)
	click(1199, 693) ;Click closest target
	escape()
Return
;Watch stream
!s::
	watchLiveStream()
Return
watchLiveStream(){
	pixelWait(474, 506, 0x466092)
	click(626, 784)
	Sleep 100
	click(484, 263)
	pixelWait(1106, 429, 0x113454)
	click(484, 263)
}
!d::
	clickWhen(859, 760, 0xA6815C, 0, 0)
	clickWhen(869, 765, 0xA7825C, 0, 0)
Return
!f::
	follow()
	commendEveryone()
	;Click share
	;if(clickWhen(1416, 287, 0x3DA8D9, 0, 0)){
	;	Sleep 100
	;	clickWhen(1412, 374, 0x57B962, 0, 0)
	;}
	beep()
Return
;Report
!+f::
	;follow()
	click(1475, 293)
Return
;Ignore invite
!g::
	ignoreInvite()
Return
;Random chat streamer
!z::
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
;Mute
!x::
	click(956, 18)
	pixelWait(453, 258, 0x4680C5)
	click(447, 302)
	click(1474, 298)
	escape()
Return
;Chat and reply
!c::
	;In general chat
	if(clickWhen(510, 749, 0x2E6CC7, 527, 776))
		Return
	;In profile dialog
	if(clickWhen(829, 582, 0x9CADD5, 0, 0))
		Return
	
	if(inLobby()){
		click(705, 812)
		return
	}
	;In lobby chat
	if(inChat() && !c(436, 970, 0xFFFFFF)){
		click(880, 803)
		return
	}
	;In draft pick
	if(c(442, 811, 0x93A4C6)){
		click(567, 811)
		click(567, 811)
		return
	}
	;In dashboard

	;When texting
	if(c(436, 970, 0xFFFFFF))
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
!v::commendEveryone()
;Buy item (mana)
!b::
	openShop()
	clickWait(540, 429, 0x43A6F2) ;Click attack
	click(604, 710) ;Click endless battle
	click(1386, 439) ;Click Azure blade
	pixelWait(1366, 782, 0xF1CE13)
	click(1400, 359) ;Prioritize
	escape()
Return
;Sell all item
!+b::
	openShop()
	sellAllItem()
	buyBasicItem()
	escape()
Return
;Click friend list
!Space::
	click(1317, 716)
Return
;Stay in lobby
>!F1::
	click(1316, 715)
	pixelWait(1248, 257, 0x0B1C2E)
	if(c(1259, 267, 0x0B1C2F)){
		click(1259, 267)
		waitClick(1091, 692, 0xD99F69)
		waitClick(460, 255, 0xFFDFAC)
	}
Return
;Watch live stream
>!F2::
	click(452, 604)
	Sleep 1000
	pixelWait(1451, 709, 0x0C3453) ;Wait until in live
	click(1388, 799)
	Sleep 500
	watchLiveStream()
	pixelWait(1456, 666, 0x0F3353) ;Wait until in live
	click(1131, 772)
	Sleep 500
	watchLiveStream()
	waitClick(466, 253, 0xFFE1AF)
Return
;Claim chess coin
>!F3::
	click(1178, 658)
	Sleep 100
	if c(1438, 291, 0xB4DAF3){
		escape()
		Sleep 100
	}
	if c(1306, 302, 0x7CCBFF) {
		escape()
		Sleep 100
	}
	waitClick(469, 634, 0xD5A443)
	pixelWait(1145, 359, 0xFCEC80)
	click(487, 347)
	click(469, 253)
	waitClick(471, 256, 0xF0AE22)
Return
;Manage first group
>!F4::
	click(1307, 386)
	waitClick(619, 306, 0xB0C4DD)
	waitClick(1354, 320, 0x8EAAFE)
Return
;Manage second group
>!F5::
	click(1317, 492)
	waitClick(619, 306, 0xB0C4DD)
	waitClick(1354, 320, 0x8EAAFE)
Return
;Invite group (after in group)
>!F6::
	waitClick(619, 306, 0xB0C4DD)
	waitClick(456, 768, 0x9CB1E4)
Return
;Consume BP
>!1::
	click(449, 350)
	pixelWait(1443, 618, 0x345D97)
	drag(1433, 654, 614, 601)
	pixelWait(1062, 711, 0x59232B)
	if(clickWhen(1031, 726, 0xE54440, 0, 0)){
		pixelWait(908, 709, 0xF0DA77)
		if(clickWhen(908, 709, 0xF0DA77, 0, 0))
			waitClick(1085, 684, 0xDCA16A) ;Confirm
	}
Return
;(In preparation) buy magic dusts
>!2::
	if(!c(657, 328, 0x4F8FDF)) 
		return
	click(1035, 317)
	waitClick(695, 340, 0x396EBB) ;Buy first item
	confirmBuyMagicDust()
	waitClick(923, 340, 0x396EBB) ;Buy second item
	confirmBuyMagicDust()
	waitClick(1149, 339, 0x396EBA) ;Buy third item
	confirmBuyMagicDust()
	back()
Return
;Start live
>!3::
	if(clickWhen(452, 599, 0x8F99C7, 0, 0)){
		waitClick(1321, 261, 0x3C7FA6)
		Sleep 500
		waitClick(724, 621, 0x4BB7CF)
		Sleep 200
		waitClick(724, 621, 0x4BB7CF)
	}
;Log exp
>!4::
	if(c(509, 280, 0xEE4A63)){
		MouseGetPos x, y
		MouseMove 552, 276
		Click, Down
		MouseMove x, y
	}
Return
;Leave lobby (stop ignore invite)
>!5::
	clickWhen(1360, 315, 0x121E2F, 0, 0) ;Move to all tab 
	pixelWait(1294, 715, 0x1C3865) ;Click friend list
	click(1314, 719)
	pixelWait(1250, 258, 0x0B1C2F)
	clickWhen(1259, 270, 0x3FDEFF, 0, 0)
	back()
Return
>!6::
	if(clickWhen(477, 687, 0x1C2445, 0, 0)){
		waitClick(516, 400, 0x135288) ;Click guess
		pixelWait(520, 423, 0x40A6EF)
		if(c(613, 402, 0x145185)){
			click(766, 263)
			waitClick(1006, 310, 0xBEDFFC) ;Click coin
			pixelWait(971, 519, 0x416DA3)
			if(c(959, 524, 0x3F699D)){
				click(1328, 279)
				back()
			}
		}
	}
Return
;Unfollow friend (click trash)
>!7::
	MouseGetPos x, y
	click(1447, y)
Return
>!q::
	if(clickWhen(1224, 820, 0x212A43, 0, 0)){
		waitClick(658, 457, 0xFFFFFF)
		pixelWait(1113, 521, 0xAB193C)
		click(1215, 719)
		pixelWait(1358, 425, 0xF2243D)
		click(1365, 785) ;Click respond
		waitClick(1239, 404, 0xFDF9EB)
		back()
		back()
	}
Return
;Mentor benefit
>!w::
	waitClick(1368, 317, 0x496BA2) ;Move to all tab 
	pixelWait(1311, 722, 0xADD7F3)
	click(1314, 719) ;Friend list
	pixelWait(1250, 258, 0x0B1C2F)
	clickWait(537, 688, 0x42A1F2) ;Mentor info
	click(918, 317) ;Seek apprentice
	waitClick(1231, 819, 0x294F7A) ;Mentor benefit
	waitClick(963, 784, 0x268DB3) ;Buy
	click(963, 784)
Return