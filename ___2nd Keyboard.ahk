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



