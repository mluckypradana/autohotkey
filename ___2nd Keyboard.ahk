#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#InstallKeybdHook
#InstallMouseHook ;<--You'll want to use this if you have scripts that use the mouse.
#UseHook On
#MaxHotkeysPerInterval 2000

;;The lines below are optional. Delete them if you need to.
#HotkeyModifierTimeout 60 ; https://autohotkey.com/docs/commands/_HotkeyModifierTimeout.htm
#KeyHistory 200 ; https://autohotkey.com/docs/commands/_KeyHistory.htm ; useful for debugging.
#MenuMaskKey vk07 ;https://autohotkey.com/boards/viewtopic.php?f=76&t=57683
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm ;prevent taskbar flashing.


WinMoveMsgBox:
  SetTimer, WinMoveMsgBox, OFF
  WinMove, Guide, , 0, 0
Return

;=========================Bluestacks=========================
#if (getKeyState("F23", "P")) and if WinActive("ahk_exe HD-Player.exe")
F23::return
home::
	MsgBox, 4096, Guide,
(
F1 | Ignore invite
F2 | Watch stream
F3 | Chess coin
F4 | Send BP
F5 | Unfollow friend
F6 | Follow nearby
F7 | Don't ignore invite
F8 | Lucky point
F9 | Guess coin
F10 | Thumbs up apprentices
F11 | Start live
F12 | Draw ticket
i | Buy magic dust
o | Buy using ad ticket
p | Chat streamer (In channel)
[ | Mentor benefit
\ | Restart
a | Celestial task
s | Preregister MCL
d | Open chest
f | Response to conquest of dawn
g | Ignore Invite
h | Turn on mic
j | Open game guardian
k | Autoclick
l | Disable auto click
z | Auto space
x | Disable auto space
c | Share
)
Return
c::
	click(1390, 373) ;Share in task
	waitClick(1279, 792, 0x4B6693) ;Share
	waitClick(1283, 745, 0x4C6894) ;Whatsapp
	pixelWait(980, 21, 0xF7F8FA) ;Whatsapp showup
	escape()
Return
global autoClick:=false
global autoSpace:=true
;Autospace
z::
	beep()
	autoSpace:=true
	while(autoSpace){
		Send {space}
		Sleep 100
	}
Return
;Disable auto space
x::
	beep()
	autoSpace:=false
Return
;Autoclick
l::
	beep()
	autoClick:=true
	while(autoClick){
		MouseGetPos x, y
		click(x, y)
		Sleep 100
	}
Return
;Disable auto click
'::
	beep()
	autoClick:=false
Return
;Open game guardian
j::
	openGameGuardian()
	MouseMove 976, 324
Return
h::
	if(c(463, 809, 0x122134)){ ;In rank
		if(c(757, 816, 0x8F8F8F)){ ;Mic is off
			click(757, 816) ;
			waitClick(760, 719, 0xA5D0F4) ;Sepaker on
			waitClick(818, 806, 0x8F8F8F) ;Wait click mic on
			waitClick(819, 712, 0xA5D0F4) ;Mic on
		}
	}
	else if c(442, 812, 0x8F8F8F) { ;In lobby
		click(442, 812) ;Speaker
		waitClick(442, 714, 0xA5D0F4) ;Speaker on
		waitClick(502, 804, 0x8F8F8F) ;Mic
		waitClick(503, 709, 0xA5D0F4) ;Mic on
	}
	else if c(446, 793, 0x2D4D67) { ;In lobby with mic on
		waitClick(443, 810, 0xA5D0F4) ;Speaker
		waitClick(440, 717, 0x848484) ;Speaker off
	}
Return
;Ignore invite
g::
	clickWhen(835, 684, 0x283F59, 0, 0)
	clickWhen(788, 640, 0x5C8DCC, 0, 0)
	pixelWait(892, 676, 0x4B6692)
	clickWhen(769, 605, 0x263D57, 0, 0)
	clickWhen(900, 678, 0x4D6896, 0, 0)
Return
;response to conquest of dawn
f::
	
	if(c(1219, 807, 0x93E3FE)){ ;Is esport
	click(1219, 807) ;Esport
	waitClick(1072, 711, 0xABD6FF) ;Contest
	waitClick(543, 683, 0xE71D35) ;Conquest of dawn
	pixelWait(1129, 557, 0xC6C6D7) ;Indo flag
	click(1289, 716) ;Response
	waitClick(1298, 774, 0x988268) ;Respond
	waitClick(1240, 405, 0xFDF9EB) ;Close 2x reward
	waitClick(503, 255, 0x90A9DC) ;Back to conquest of dawn
		
	}
Return
;Open chest
d::
	if clickWhen(1351, 732, 0x9F876B, 0, 0){
		Sleep 200
		if c(981, 599, 0x1F354D) {
			waitClick(1069, 591, 0x346E80)
			waitClick(885, 681, 0xA38A6D)
		}
	}
Return
;Preregister MCL
s::
	if(clickWhen(1394, 459, 0xC48330, 0, 0)){ ;Squad
		waitCLICK(1396, 459, 0xC28231) ;Preregister
		waitClick(957, 683, 0xB09154) ;Start invitation
		pixelWait(957, 683, 0x6A778B) ;Invite Success
		waitClick(1267, 340, 0xFBFBFD) ;Close
		waitClick(477, 255, 0x8EA6D9) ;Back
	}
Return
;Celestial task
a::
	
	if(clickWhen(453, 802, 0xAAD5FE, 0, 0)){ ;Daily
		pixelWait(549, 335, 0x8BDDFF) ;Daily quests
		click(511, 457) ;Celestial task
	}
Return
;Restart
\::
	Send ^+5
	Sleep 500
	Loop 2
		drag(982, 103, 987, 1079)
	Sleep 100
	click(1418, 38) ;Clear all
	waitClick(1054, 159, 0xF2D590) ;Mobile legends
	pixelWait(947, 710, 0x424242) ;Ok Game guardian
	pixelWait(947, 710, 0x424242) ;Ok Game guardian
	pixelWait(947, 710, 0x424242) ;Ok Game guardian
	waitClick(947, 710, 0x424242) ;Ok Game guardian
	openGameGuardian()
	MouseMove 1026, 228
Return
;Mentor benefit
[::
	if(c(1293, 713, 0x85A9CB)){ ;Friend
		click(1294, 704) ;Friend
		pixelWait(548, 331, 0x8CDCFF) ;Contacts
		click(496, 574) ;Mentor info
		clickWait(540, 573, 0x87D8FD) ;Mentor info
		clickWait(831, 334, 0xE7EDF1) ;Seek mentor
		waitClick(1182, 815, 0x5172A9) ;Mentor points benefit
		waitClick(897, 768, 0x4873B2) ;
		waitClick(897, 768, 0x4873B2) ;Buy twice		
	}
Return
;Chat streamer (In channel)
p::
	click(1129, 815) ;Tap to enter
	pixelWait(960, 1012, 0xFFFFFF) ;Tap to enter
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
	pixelWait(1427, 491, 0xD1C4A3)
	pixelWait(1427, 491, 0xD1C4A3)
	pixelWait(1427, 491, 0xD1C4A3)
	pixelWait(1427, 491, 0xD1C4A3)
	pixelWait(1427, 491, 0xD1C4A3)
	click(1446, 1040) ;OK
	escape()
Return
;Buy using ad ticket
o::
	if c(619, 435, 0x3E6DA9){ ;Preparation
		click(507, 804) ;Fragments
		pixelWait(547, 802, 0x8BDCFF) ;Fragments
		click(1032, 322) ;Ad shop
		waitClick(1351, 620, 0x4381A8) ;Wait click
		waitClick(953, 729, 0xCFB17D) ;Use ad ticket	
		waitClick(477, 255, 0x8EA6D9) ;Back
	}
Return
;(In preparation) buy magic dusts
i::
	if !c(1377, 311, 0x4C6794) 
		return
	click(1028, 322)
	waitClick(611, 455, 0x4071B0) ;Buy first item
	confirmBuyMagicDust()
	waitClick(834, 435, 0x3D6DA9) ;Buy second item
	confirmBuyMagicDust()
	waitClick(1066, 445, 0x3F70AC) ;Buy third item
	confirmBuyMagicDust()
Return
confirmBuyMagicDust(){
	waitClick(899, 707, 0x9E866A) ;Buy
	waitClick(1032, 666, 0x9E876A) ;Confirm
	Sleep 300
}
;Draw ticket
u::
	if !c(906, 252, 0x40799E) ;Not in lucky shop
		Return
	if !c(1304, 777, 0x96DBF5) ;Skip animation?
		click(1297, 783)
	click(1226, 551) 
	waitClick(868, 573, 0x253C55) ;Dont show again
	click(1033, 645)
Return
;Start live
y::
	if(clickWhen(1373, 257, 0x87AFD3, 1306, 263)){
		waitClick(1320, 265, 0x3C7FA6) ;Click my channel
		waitClick(814, 605, 0x4687AF) ;Click start live stream
		waitClick(814, 605, 0x4687AF) ;Click start live stream
		Sleep 1000
		clickWhen(814, 605, 0x4687AF, 0, 0) ;Click start live stream	
	}
Return
;Thumbs up apprentices
t::
	MouseGetPos x, y
	click(x, y)
	pixelWait(940, 716, 0x375881)
	if c(940, 716, 0x375881){
		click(1037, 714) ;Check
		pixelWait(1181, 345, 0x626E82)
		pixelWait(1181, 345, 0x626E82)
		;Like
		click(1443, 606)
		click(1443, 606)
		Sleep 50
		Send {esc}
	}
Return
;Guess coin
r::
	if(clickWhen(1112, 815, 0xACD7FF, 0, 0)){ ;Dot red
		waitClick(1072, 760, 0xACD7FF) ;Dot esports
		pixelWait(582, 277, 0xF4F4F4) ;Livestream channel
		clickWait(516, 403, 0x99B3D6) ;Guess
		waitClick(1347, 366, 0x5CABCC) ;Tasks 
	}
Return
e::
	if(clickWhen(460, 361, 0xD0BF74, 0, 0)){ ;Shop
		pixelWait(555, 335, 0x8DDFFF) ;Recommend
		click(500, 395) ;Aurora Summon
		waitClick(1457, 748, 0xB23446)
	}
Return
q::
	if(c(1426, 256, 0x7EA8CB)){
		click(1427, 258) ;Setting
		pixelWait(550, 335, 0x8BDDFF) ;Basic
		click(521, 696) ;Privacy setting
		pixelWait(551, 694, 0x8CDDFF) ;Privacy setting
		click(928, 398) ;On
		pixelWait(1231, 679, 0x395A7D) ;Wait dialog
		click(1095, 680) ;Okay
		waitClick(478, 255, 0x8CA4D6) ;Back
	}
Return
w::
	if(c(1371, 258, 0x87B0D3)){
		click(1305, 265) ;Live channel
		pixelWait(1390, 711, 0x3C6182) ;Mic 1
		pixelWait(1390, 711, 0x3C6182) ;Mic 1
		pixelWait(1390, 711, 0x3C6182) ;Mic 1
		click(1375, 614) ;
		pixelWait(1043, 368, 0x9B8469) ;Follow button
		click(706, 778) ;Watch
		Sleep 150
		click(495, 258) ;Back
		waitClick(479, 253, 0x889ED0) ;Back
		pixelWait(1234, 664, 0x486D88) ;Mic 2
		pixelWait(1234, 664, 0x486D88) ;Mic 2
		pixelWait(1234, 664, 0x486D88) ;Mic 2
		click(1137, 627) ;
		pixelWait(1043, 370, 0xA2896E) ;Follow button
		click(709, 785) ;Watch
		Sleep 150
		click(495, 259) ;Back
		waitClick(479, 253, 0x889ED0) ;Back
		pixelWait(1320, 261, 0x3C7FA6) ;My live channel
		click(489, 260) ;Back
	}
Return
F3::
	click(958, 667) ;Battle type
	waitClick(1169, 421, 0x6161B3) ;Arcade
	waitClick(1316, 378, 0x9C8469) ;Magic chess
	waitClick(1307, 307, 0xF9FAFC) ;Close dialog
	if clickWhen(531, 350, 0xAD3042, 0, 0) { ;Magic Competition
		waitClick(481, 353, 0x4AD5EC)
		waitClick(429, 255, 0x3C68B4) ;Back from magic competition
	}
	waitClick(443, 263, 0xB0C9F2) ;Back from magic chess
Return
F4::
	if(clickWhen(1292, 713, 0x7FA3C2, 0, 0)){ ;Friends
		pixelWait(553, 333, 0x8CDEFF) ;Contacts
		click(801, 313) ;FB Friends
		pixelWait(751, 322, 0x5599C7) ;FB Friends
		click(1446, 379) ;BP1
		closeBp()
		pixelWait(751, 322, 0x5599C7) ;FB Friends
		click(1444, 476) ;BP2
		closeBp()
		pixelWait(751, 322, 0x5599C7) ;FB Friends
		click(1445, 568) ;BP3
		closeBp()
		pixelWait(751, 322, 0x5599C7) ;FB Friends
		click(1446, 661) ;BP4
		closeBp()
	}
Return
F7::
	MouseGetPos x, y
	click(1306, y-16)
	click(1306, y-8)
	click(1306, y+8)
	click(1306, y+16)
	click(1358, y-16)
	click(1358, y-8)
	click(1358, y+8)
	click(1358, y+16)
	waitClick(1015, 681, 0x9C856A)
	tooltip("Friend removed")
Return
F11::
	MouseGetPos x, y
	click(1410, y)
	click(1410, y)
Return
F12::
	if clickWhen(1419, 259, 0x81AACF, 0, 0) {
		pixelWait(551, 335, 0x8CDEFF) ;Wait basic
		click(521, 696) ;Privacy setting
		pixelWait(551, 694, 0x8CDDFF) ;Privacy setting
		pixelWait(1311, 807, 0x4C6894)
		click(825, 395)
		pixelWait(789, 401, 0x3A75BA)
		Send {esc}
	}
Return
closeBp(){
	Sleep 100
	if(c(1018, 681, 0x9E866A)){ ;Close dialog
		Send {esc}
	}
}

#if
;=========================Android Studio=========================
#if WinActive("ahk_exe idea64.exe")
Numpad0::
	SetTimer, WinMoveMsgBox, 50
	MsgBox, 4096, Guide,
(
Numpad0 | Show dialog
Numpad1 | Run
Numpad2 | Create new string
)
Return
Numpad1::
	SetKeyDelay 50
	Send ^!l
	Send ^!{F10}
	Send +{F10}
	Send !5
	Send !4
	WinActivate, ahk_exe qemu-system-i386.exe
	SetKeyDelay -1
Return
Numpad2::
	SetKeyDelay 50
	Send ^w
	Send ^c
	Send !{Enter}
	Send {Enter}
	Send ^v
	Send !+u
	Send !+u
	Send {home}
	SetKeyDelay -1
Return
Numpad3::
	SetKeyDelay 50
	Send !+u
	Send !+u
	Send !+u
	Send !+u
	Send !+u
	Send !+u
	SetKeyDelay -1
Return
#if
#if (getKeyState("F23", "P")) and if WinActive("ahk_exe idea64.exe")
F23::return
space::
	autoFormat()
	Send !^{F10}
	Send +{F12}
Return
c::
	Send !{F1}
	Sleep 200
	Send 1
	Sleep 200
	Send ^c
	Send ^v
Return
autoFormat(){
	Send !^l
	Sleep 500
	Send !^o
}
#if
;=========================Guitar Rig=========================
#if (getKeyState("F23", "P")) and if WinActive("ahk_exe Guitar Rig 5.exe")
F23::return
home::
	SetTimer, WinMoveMsgBox, 50
	MsgBox, 4096, Guide,
(
End | Reselect audio codec
)
Return
end::
	Send {alt}
	Loop, 3	
		Send {up}
	Send {enter}
	pixelWait(868, 504, 0xDEDEDE)
	click(1041, 494) ;Device
	pixelWait(1131, 534, 0x505050) ;Dropdown show
	MouseGetPos x, y
	MouseMove 995, 594
	Loop, 5{
		Click WheelDown
	}
	MouseMove x, y
	click(997, 524) ;USB Audio codec
	Send {esc}
Return
#if
;=========================WhatsApp=========================
#if (getKeyState("F23", "P")) and if WinActive("ahk_exe WhatsApp.exe")
F23::return
#Include D:\Other\Hotkeys\Mobile Games\__Functions.ahk

home::
	SetTimer, WinMoveMsgBox, 50
	MsgBox, 4096, Guide,
(
q | Smile
w | Laugh
e | Sad
r | Monkey
)
Return
q::
	Send +{Tab}
	Send {Space}
	Sleep 100
	MouseMove 485, 825
	Send laugh
Return
#if
;=========================Google Chrome=========================
#if (getKeyState("F23", "P")) and if WinActive("ahk_exe chrome.exe")
F23::return
#if
#if WinActive("ahk_exe chrome.exe")
Numpad0::
	MsgBox, 4096, Guide,
	(
Numpad1 | Start timer for 25 minutes
Numpad2 | Set to all page for kompas
	)
Return
Numpad1::
	Send ^t
	Send start timer for 25 minutes
	Send {enter}
	Send ^+{Tab}
Return
Numpad2::
	Send ^l
	Sleep 100
	Send {Right}
	Sleep 100
	Send ?page=all
	Send {enter}
Return
Numpad4::
	Send {End}
	Send {Space}[PROGRESS]
Return
Numpad5::
	Send {End}
	Send {Space}[TESTING]
Return
Numpad6::
	Send {End}
	Send {Space}[DONE]
Return
#if
;=========================General=========================
global needTab:=false
#if (getKeyState("F23", "P"))
F23::return
home::
	SetTimer, WinMoveMsgBox, 50
	MsgBox, 4096, Guide,
(
+q if
+w isColor
+a click
+x pixelWait
+s waitClick
+d clickWait
+z Sleep
q Write multiseparator
w Write separator
pageup debug
pagedown exitapp
del Close unnecesary processes
)
Return
pgup::
	;Debug
Return
pgdn::ExitApp

+x::
	SetTimer, WinMoveMsgBox, 0
	MsgBox, 4096, Title, 
	(
		Apalah arti mencinta
	)
Return
+q::
	newLine()
	needTab:=true
	Send if(){{}}{}
	Send {enter}
	Send {up}{end}{left}{left}
Return
+w::
	MouseGetPos x, y
	PixelGetColor, color, x, y, RGB
 	Send % "c(" x . ", " . y . ", " . color . ")"
	newComment()
Return
+z::
	newLine()
	Send Sleep{space}
Return
;Tab with space
e::
	Send {space}{space}{space}{space}
Return
;Write separator -
w::
	Loop 49{
		Send {-}
	}
Return
;Write separator =
q::
	Loop 25{
		Send {=}
	}
Return
newLine(){
	focusEditor()
	Send {end}
	Send {enter}
	if needTab {
		Send {tab}
		needTab:=false
	}
}
focusEditor(){
	IfWinExist ahk_exe sublimetext.exe
		WinActivate
}
newComment(){
	Send {end}{space}`;
}
#if
NumpadSub::
	Send {End}
	Send {Shift down}
	Send {Home}
	Send {Shift up}
	Send ^x
	Send {Backspace}
	Send {home}
	Send {enter}
	Send {up}
	Send ^v
Return
NumpadAdd::
	Send {End}
	Send {Shift down}
	Send {Home}
	Send {Shift up}
	Send ^x
	Send {Backspace}
	Send {down}
	Send {end}
	Send {enter}
	Send ^v
Return
NumpadDiv::
	Send mluckypradana
Return
NumpadMult::
	Send januari1{!}
	Send {left}{left}
Return

;;================= MODIFIERS REMAPPED ======================;;

SC070::tooltip, [F23] Lshift -to-> SC070-International 2
SC071::tooltip, [F23] LCtrl -to-> SC071-Language 2
SC072::tooltip, [F23] LWin -to-> SC072-Language 1
SC073::tooltip, [F23] LAlt -to-> SC073-International 1

SC077::tooltip, [F23] RAlt -to-> SC077-Language 4
SC078::tooltip, [F23] RWin -to-> SC078-Language 3
SC079::tooltip, [F23] AppsKey -to-> SC079-International 4
SC07B::tooltip, [F23] RCtrl -to-> SC07B-International 5
SC07D::tooltip, [F23] RShift -to-> SC07D-International 3

;;================= LOCKING KEYS ======================;;

F20::tooltip, [F23] CapsLock -to-> SC06B-F20
SC05C::tooltip, [F23] NumLock -to-> SC05C-International 6
;Numlock is an AWFUL key. I prefer to leave it permanently on.
;It's been changed to International 6, so you can use it with no fear that it'll mess up your numpad.
SC061::tooltip, [F23] ScrollLock -to-> SC061 %A_thishotKey%

;;;--------------------IMPORTANT: HOW TO USE #IF THINGIES----------------------

;;You can use more than one #if thingy at a time, but it must be done like so:
#if (getKeyState("F23", "P")) and if WinActive("ahk_exe Adobe Premiere Pro.exe")
F1::msgbox, You pressed F1 on your secondary keyboard while inside of Premiere Pro

;; HOWEVER, You still would still need to block F1 using #if (getKeyState("F23", "P"))
;; If you don't, it'll pass through normally, any time Premiere is NOT active.
;; Does that make sense? I sure hope so.



