#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
setmousedelay -1
setkeydelay -1
#Include __Functions.ahk
#Include ../___Basic.ahk


>!\::ExitApp
>!/::
	;Debug
Return
;Disable assist
>!>+,::
	closeThreads(9, "_Thread")
	tooltip("Assist stopped")
Return
;Assist
>!,::
	runThreads(9, "_Thread")
	tooltip("Assist started")
Return
;Thumbs up apprentice
>!;::
	thumbsUpEnabled:=true
	beep()
	while(thumbsUpEnabled){
		if c(940, 716, 0x375881){
			click(1037, 714) ;Check
			pixelWait(1408, 696, 0x60758C)
			;Like
			click(1443, 606)
			click(1443, 606)
			escape()
		}
	}
Return
>!>+;::
	thumbsUpEnabled:=false
	beep()
Return

;Use bundle inventory
>!>+'::
	closeThread("_ThreadUseInventory")
	tooltip("Use inventory stopped")
Return
>!'::
	runThread("_ThreadUseInventory")
	tooltip("Use inventory started")
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
	clickWhen(1290, 608, 0xD15967, 0, 0) ; daily supply Free
	clickWhen(794, 462, 0xCB14CC, 964, 710) ; daily supply Free button
	clickWhen(974, 541, 0xC410C4, 1128, 755) ; daily supply watch videos
	clickWhen(1180, 644, 0xF8E1A4, 957, 744) ; daily supply watch button
	clickWhen(1405, 72, 0xBCBDCC, 0, 0) ; Tap to skip
	clickWhen(661, 760, 0x9CF7FE, 1349, 731) ; Watch video chest
	if c(1172, 500, 0xF1E09C) { ;Free Lucky Draw
		if(clickWhen(1285, 553, 0xE0BF75, 0, 0)){ ;Draw
			waitClick(750, 681, 0x4D6996)
		}
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
;Increase volume
!F2::
	;If in game
	if c(626, 45, 0xA6B8D8){
		click(633, 55)
		pixelWait(1396, 295, 0xF8F9FB)
		click(556, 504) ;Sound
		pixelWait(868, 414, 0x3771B6)
		click(1088, 530) ;Sound effect
		click(1091, 652) ;System notification
		escape()
	}
	else if c(1420, 259, 0x82ABCE) {
		waitClick(1419, 258, 0x82ACCF)
		pixelWait(552, 338, 0x8CDEFF)
		click(530, 573)
		pixelWait(547, 577, 0x8BDDFF)
		drag(618, 713, 620, 369)
		pixelWait(879, 738, 0x234586)
		click(1106, 669)
		escape()
	}
Return
!+F2::
	
	;If in game
	if c(626, 45, 0xA6B8D8){
		click(633, 55)
		pixelWait(1396, 295, 0xF8F9FB)
		click(556, 504) ;Sound
		pixelWait(868, 414, 0x3771B6)
		click(893, 528) ;Sound effect
		click(892, 651) ;System notification
		escape()
	}
	else {
		waitClick(1419, 258, 0x82ACCF)
		pixelWait(552, 338, 0x8CDEFF)
		click(530, 573)
		pixelWait(547, 577, 0x8BDDFF) ;Wait sound
		drag(618, 713, 620, 369)
		pixelWait(879, 738, 0x234586)
		click(881, 669) ;Decrease
		escape()
	}
Return
;Change controller
!F3::
	;Back to fullscreen
	;Exit fullscreen
	if c(1552, 8, 0x000000) 
		Send {F11}
	pixelWait(1510, 20, 0x232642)
	if c(1580, 12, 0x232642){
		click(1902, 147)
		pixelWait(1805, 256, 0x2B2E4C)
		click(1792, 279)
		MouseMove 1790, 201
		Sleep 2000
		pixelWait(1814, 254, 0x2B2E4C)
		if c(1814, 254, 0x2B2E4C)
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
^z::quickChatStreamer(1043, 451)
^x::quickChatStreamer(1075, 495)
^c::quickChatStreamer(1092, 542)
^v::quickChatStreamer(1074, 596)
^b::quickChatStreamer(1037, 640)
^n::quickChatStreamer(1011, 690)
^m::quickChatStreamer(683, 641)
^,::quickChatStreamer(676, 689)
^q::chatDrag(1387, 413)
^w::chatDrag(1390, 326)
^e::chatDrag(1388, 225)
^r::chatDrag(1387, 133)
^t::chatDrag(1387, 8)
^a::iconDrag(1364, 181)
^s::iconDrag(1369, 277)
^d::iconDrag(1440, 353)
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
	pixelWait(921, 782, 0x4C5362)
	click(701, 783)
	Sleep 100
	click(484, 263)
	escape()
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
	pixelWait(1476, 257, 0xFBFCFD)
	click(436, 333)
	click(1484, 335)
	escape()
Return
;Chat and reply
!c::
	;Is typing, click OK
	if clickWhen(1427, 1003, 0xFFFFFF, 0, 0){
		;Send
		click(886, 807)
		return
	}
	;Has chat in dashboard
	if clickWhen(441, 738, 0x3186C9, 0, 0)
		return
	;Has chat in lobby
	if clickWhen(529, 795, 0x1C996B, 613, 816)
	;In chat dialog
	if clickWhen(879, 811, 0x4772AF, 622, 811)
		return
Return
!v::commendEveryone()
prioritizeAndRecommend(){
	Sleep 100
	click(1391, 360) ;Prioritize
	Sleep 100
	click(494, 342) ;Recommend
	escape()
}
;Azure blade
!1::
	openShop()
	click(549, 411) ;Attack
	Sleep 75
	click(605, 723) ;Click endless battle
	Sleep 75
	click(1386, 439) ;Click Azure blade
	Sleep 75
	prioritizeAndRecommend()
Return
!2::
	openShop()
	click(549, 599) ;Movement
	Sleep 75
	click(805, 326) ;Tough boots
	prioritizeAndRecommend()
Return
!3::
	openShop()
	click(549, 474) ;Magic
	Sleep 75
	click(804, 435) ;NOD
	prioritizeAndRecommend()
Return
!4::
	openShop()
	click(549, 411) ;Attack
	Sleep 75
	click(872, 251) ;Second type
	Sleep 75
	click(596, 630) ;Sea halberd
	Sleep 75
	click(1391, 360) ;Prioritize
	Sleep 75
	click(872, 251) ;Second type
	Sleep 75
	click(494, 342) ;Recommend
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
^1::quickChat(1368, 113) ;Quick chat 2
^2::quickChat(1373, 165) ;Quick chat 3
^3::quickChat(1370, 218) ;Quick chat 4
^4::quickChat(1375, 271) ;Quick chat 5
^6::quickChat(1368, 373) ;Quick chat 7
^5::quickChat(1372, 67) ;Quick chat 1
^`::quickChat(1367, 322) ;Quick chat 6
quickChat(x, y){
	if !allowChat() 
		return
	Send {F4}
	pixelWait(1439, 429, 0x4976B5)
	click(1217, 92) ;Chat
	click(x, y) ;Wait
}
allowChat(){
	return c(1470, 214, 0x9CCBE1)
}
;Ignore invite
>!F1::
	if clickWhen(1419, 259, 0x81AACF, 0, 0) {
		pixelWait(551, 337, 0x8CDEFF)
		click(500, 698)
		waitClick(958, 401, 0x385270)
		Sleep 50
		if clickWhen(1012, 680, 0x9C8469, 0, 0)
			escape()
	}
Return
;Watch live stream
>!F2::
	if clickWhen(1305, 264, 0x8DB7DB, 0, 0){
		Sleep 2000
		click(1445, 675)
		watchLiveStream()
		Sleep 2000
		click(1242, 666)
		watchLiveStream()
		escape()
	}
Return
;Claim chess coin
>!F3::
	click(970, 518) ;Match type
	waitClick(1459, 559, 0x704868) ;Arcade
	waitClick(1330, 379, 0x9D866C) ;MC
	waitClick(1307, 307, 0xF9FAFC) ;Close version highlights

	;Prime wheel
	if c(509, 519, 0xBA394C) {
		click(483, 536)
		waitClick(456, 588, 0xF9F9C4)
		escape()
	}

	waitClick(480, 635, 0xFFFFDD) ;Magic Competition
	pixelWait(1150, 353, 0xFCEC7F) ;Chess coin
	click(486, 352)
	escape()
	Sleep 100
	escape()
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
	if !c(646, 333, 0xE7EDF1) 
		return
	click(1028, 322)
	waitClick(692, 342, 0x3B70BD) ;Buy first item
	confirmBuyMagicDust()
	waitClick(922, 342, 0x3B70BD) ;Buy second item
	confirmBuyMagicDust()
	waitClick(1147, 341, 0x3A6FBC) ;Buy third item
	confirmBuyMagicDust()
	back()
Return
confirmBuyMagicDust(){
	waitClick(899, 707, 0x9E866A) ;Buy
	waitClick(1032, 666, 0x9E876A) ;Confirm
	Sleep 300
}
;Start live
>!3::
	if(clickWhen(1305, 265, 0x8CB6DA, 0, 0)){
		waitClick(1280, 255, 0xACBCDE) ;Click my channel
		waitClick(815, 602, 0x4483AA) ;Click start live stream
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
	if clickWhen(1419, 259, 0x81AACF, 0, 0) {
		pixelWait(551, 337, 0x8CDEFF)
		click(500, 698)
		pixelWait(553, 694, 0x8CDEFF)
		click(788, 398)
		escape()
	}
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
	click(1306, y-10)
	click(1306, y+10)
	click(1358, y-10)
	click(1358, y+10)
	waitClick(1015, 681, 0x9C856A)
	beep()
Return
;Use max bundle inventory
>!8::
	if clickWhen(1461, 730, 0x9B836A, 0, 0){
		Sleep 100
		if c(1117, 594, 0x356F88) {
			waitClick(1114, 594, 0x356F88)
			waitClick(895, 679, 0xA1896B)
		}
	}
Return
>!q::
	if(clickWhen(1112, 814, 0xACD7FF, 0, 0)){
		waitClick(1072, 711, 0xABD6FF)
		waitClick(544, 699, 0xF4F4F4)
		pixelWait(1411, 262, 0x4B6591)
		click(1284, 721) ;Respond
		waitClick(1239, 404, 0xFDF9EB)
		escape()
		Sleep 100
		escape()
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