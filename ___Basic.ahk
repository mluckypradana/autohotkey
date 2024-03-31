#NoEnv
SetWorkingDir %A_ScriptDir%
#SingleInstance force
CoordMode, Mouse, Screen
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
SetCapsLockState, AlwaysOff
SetNumLockState, AlwaysOn
setmousedelay -1
setkeydelay -1
SetTitleMatchMode, 2 ; Set title match mode to match any window title containing the specified text

Process,Close,NVDisplay.Container.exe
Process,Close,OfficeClickToRun.exe

global actualScreenX:=1920
global actualScreenY:=1080
global volumeMuted:=false
global detectorX:=0
global detectorY:=0
global detectorColor:=0x000000
global shakeMouseEnabled:=false
global currentDisplay:=1
global currentDesktop:=1
global copiedList := []
global projectionExtended := false
global textingMode := false
global isWhatsAppActive := false 

!Esc::
	file:=A_ScriptDir . "\" . A_ScriptName
	tooltip(file)
	Run % file, , , processId
Return
;Shutdown PC
+Pause::
	tooltip("Shutting down")
	runCommand("shutdown /s /f")
Return
Capslock & q::LButton
Capslock & w::RButton
Capslock & e::Click WheelUp
Capslock & d::Click WheelDown

;Hide cursor
ScrollLock::
	runCommand("sc config ""Capability Access Manager Service"" start=disabled")
	runCommand("sc stop ""Capability Access Manager Service""")
Return
Capslock & /::
	;Debug
	untapButtons()
Return
Capslock & \::ExitApp

Capslock & LButton::
	prevDesktop()
	currentDesktop:=1
Return
prevDesktop(){
	Send ^#{Left}
	Send {Ctrl up}{Window up}
	SetCapsLockState, AlwaysOff
	global currentWindow:=1
}
Capslock & RButton::
	nextDesktop()
	currentDesktop:=2
Return
nextDesktop(){
	Send ^#{Right}
	Send {Ctrl up}{Window up}
	SetCapsLockState, AlwaysOff
	global currentWindow:=1
}
Capslock & WheelDown::
	Send #{Up}
	Sleep 25
	Send #{Left}
Return
Capslock & WheelUp::
	Send #{Up}
	Sleep 25
	Send #{Right}
Return
Capslock & F1::
	prevDesktop()
	prevDesktop()
	currentDesktop:=1
Return

Capslock & F2::
	prevDesktop()
	prevDesktop()
	prevDesktop()
	nextDesktop()
	currentDesktop:=2
Return
Capslock & F3::
	nextDesktop()
	nextDesktop()
	currentDesktop:=3
Return
Capslock & r::Volume_up
Capslock & f::Volume_down

copy(){
	Send,^c
	Send,^c
	tooltip(clipboard)
	ClipWait
}
Capslock & t::
	SoundSet, +1, , mute
Return
Capslock & s::
	Send {Media_Play_Pause}
Return
Capslock & a::
	saveLastWindow()
	WinActivate ahk_exe msedge.exe
	Send {Left}
	focusLastWindow()
Return
;Always on top
Capslock & o::
	Winset, Alwaysontop, , A
	beep()
Return
;Headset mode
Capslock & Up::moveMouse(0, -1)
Capslock & Down::moveMouse(0, 1)
Capslock & Left::moveMouse(-1, 0)
Capslock & Right::moveMouse(1, 0)
;Transparent
!^+t::
	WinGet, TransLevel, Transparent, A
	If (TransLevel = 150) {
		WinSet, Transparent, OFF, A
	} Else {
		WinSet, Transparent, 150, A
	}
Return
;Numpad5::moveMouse(0, -20)
;Numpad2::moveMouse(0, 20)
;Numpad1::moveMouse(-20, 0)
;Numpad3::moveMouse(20, 0)
;Numpad0::Click L
;NumpadDot::Click R
;NumpadEnter::Return
; Define hotkeys for each numpad key with modifiers
!^+1::Send {Numpad1}
!^+2::Send {Numpad2}
!^+3::Send {Numpad3}
!^+4::Send {Numpad4}
!^+5::Send {Numpad5}
!^+6::Send {Numpad6}
!^+7::Send {Numpad7}
!^+8::Send {Numpad8}
!^+9::Send {Numpad9}
!^+0::Send {Numpad0}

; Repeat the numpad key when held down
$Numpad1::
$Numpad2::
$Numpad3::
$Numpad4::
$Numpad5::
$Numpad6::
$Numpad7::
$Numpad8::
$Numpad9::
$Numpad0::
    while GetKeyState(A_ThisHotkey, "P")
    {
        Send {%A_ThisHotkey%}
        Sleep 50
    }
return

;Only for development========================
Capslock & 3::
	;Send {Right}
	Send {Space}{{}
	Send {Enter}
	Send return true
	Send {Home}
	Send {Enter}{up}
Return
;Development
!^+z::
	tooltip("z: x, y, color | x: x, y | c:: #color", 3000)
	Input, savedKey, L1 M
	if(savedKey=="z"){
		MouseGetPos x, y
		PixelGetColor, color, x, y, RGB
		clipboard := % x . ", " . y . ", " . color
		tooltip(clipboard)
	}
	else if(savedKey=="x"){
		copyCoordinate()
	}
	else {
		MouseGetPos x, y
		PixelGetColor, color, x, y, RGB
		clipboard := % color
		splitRgbColor(color, red, green, blue)
		code:=blackGrayWhite(red, green, blue)
		tooltip(clipboard . ", " . red . " " . green . " " . blue . ", " . code)
	}
return
;Delay get color
!#z::
	MouseGetPos x, y
	Sleep 2000
	PixelGetColor, color, x, y, RGB
	clipboard := % x . ", " . y . ", " . color
	tooltip(clipboard)
return
!^+s::
	copyCoordinate()
Return
!^+d::
	MouseGetPos x, y
	PixelGetColor, color, x, y, RGB
	clipboard := % color
	splitRgbColor(color, red, green, blue)
	code:=blackGrayWhite(red, green, blue)
	tooltip(clipboard . ", " . red . " " . green . " " . blue . ", " . code)
return
;Write date
:R*?:~d::
	FormatTime, CurrentDateTime,, yyyyMMdd
	SendInput %CurrentDateTime%
return
;Toggle focus Ms Edge google chrome
Capslock & g::
	if WinActive("ahk_exe msedge.exe") {
		focusLastWindow()
	}
	else{
		saveLastWindow()
		if WinExist("ahk_exe msedge.exe")
			WinActivate ; Use the window found by WinExist.
		;Run, C:\Program Files\Google\Chrome\Application\chrome.exe
	}
Return
Capslock & h::
	saveLastWindow()
	if WinExist("ahk_exe chrome.exe") {
		WinActivate
		ControlFocus, Chrome_AutocompleteEditView1
		Send {Left}
	}
	focusLastWindow()
Return

;Connect bluetooth
Capslock & b::
	runCommand("btcom -b 1C:52:16:B8:82:A7 -c -s110b", 10000)
Return

Capslock & n::runCommand("btcom -b 1C:52:16:B8:82:A7 -r -s110b", 10000)
;Copy array
!^+c::
	copyArray()
Return
;Paste array
!^+v::
	pasteArray()
Return
;Reset array
!^+x::
	copiedList := []
	tooltip("copiedList: 0")
Return
;Change projection mode
CapsLock & `::
	Send #p
	Sleep 1000
	if !projectionExtended{
		Send {Down}
		Send {Down}
	} else {
		Send {PgUp}
	}
	Send {Space}
	Send {Esc}
	projectionExtended := !projectionExtended
Return
;Send expressions
:*?:/wedding::
	pasteText(Clipboard, " alhamdulillah selamat, semoga menjadi keluarga yang sakinah mawadah warahmah. Lancar sampai hari H dan seterusnya. Aamiin ")
Return
:*?:/hbd::
	pasteText(Clipboard, " happy birthday. Semoga sukses, sehat dan bahagia selalu ")
Return
:*?:/child::
	pasteText(Clipboard, " selamat untuk kelahiran anaknya, semoga menjadi anak yang baik juga berbakti kepada orang tua ")
Return
:*?:/mourn::
	pasteText(Clipboard, " turut berduka cita, semoga amal ibadahnya diterima dan keluarga diberikan kesabaran dan kekuatan ")
Return
;Send 5w1h note template
:*?:/5w1h::
	pasteFile("\Templates\5w1h.txt")
Return
:*?:/journal::
	pasteFile("\Templates\journal.txt")
Return
:*?:/dell::CPX-05A018HWFZZ
:*?:/==::
	pasteText(Clipboard, "==================================")
Return
:*?:/--::
	pasteText(Clipboard, "-------------------------------------------------------------------")
Return
;Get IP Address
:*?:/ipaddress::
	getIpAddress()
Return
!F6::getIpAddress()
getIpAddress(){
	IPAddress1 =
	try {
		IPAddress1 := ComObjCreate("WScript.Shell").Exec("ipconfig").StdOut.ReadAll()
		regex := "IPv4 Address.*?: (\d+\.\d+\.\d+\.\d+)"
		IPAddress1 := Substr(IPAddress1, 200, length(IPAddress1))
		IPAddress1 := RegExMatch(IPAddress1, regex, IPAddress1)
		IPAddress1 := IPAddress11
	} catch {
		MsgBox, 16, Error, An error occurred while getting the IP address.`n`nError: %A_LastError%
	}

	; Display the first local IP address
	Clipboard := IPAddress1
}
;==================================
;Texting mode
!F1::
	textingMode := !textingMode
	SoundBeepToggle(textingMode)
return

#If textingMode
	#Include %a_scriptdir%\___Texting.ahk
#If

~LButton::
	sleep 100
	IfWinActive, WhatsApp
	{
		if(!textingMode){
			textingMode := true
			SoundBeepToggle(true)	
		}
		return
	}
	textingMode := false
return

SoundBeepToggle(mode) {
	if (mode){
		SoundBeep 300, 200
		tooltip("Texting mode: " textingMode)
	}
	else
		SoundBeep 200, 200
}

; Auto-enable texting mode for WhatsApp
Loop
{
    Sleep, 500
    CheckWindowTitle()
}

CheckWindowTitle(){
	IfWinActive, WhatsApp
	{
		tooltip("Whatsapp is active")
		isWhatsAppActive := true
		if(!textingMode) {
			textingMode := true
			SoundBeepToggle(textingMode)
		}
	}
	else
	{
		isWhatsAppActive := false
	}
}
;==================================

!RButton::
	Send {F5}
	While GetKeyState("RButton", "P") && GetKeyState("LAlt", "P")
    {
        Click R
        Sleep 50  ; Adjust the sleep duration as needed for your preference
    }
return
;Repeat click
!+^LButton::
	Send {F5}
    While GetKeyState("LButton", "P") && GetKeyState("LAlt", "P")
    {
        Click
        Sleep 50  ; Adjust the sleep duration as needed for your preference
    }
	Send {Alt}{up}
	Send {LAlt}{up}
	Send {F4}
return
XButton2::
While GetKeyState("XButton2", "P") && GetKeyState("LAlt", "P")
{
	Click
	Sleep 50  ; Adjust the sleep duration as needed for your preference
}
Return
XButton1::
if(currentDesktop==2){
	prevDesktop()
	Return
}
Return
; Function to get the current virtual desktop index
VirtualDesktop() {
    hWnd := WinExist("A")
    desktopNum := DllCall("User32.dll\GetWindowDesktopNumber", "Ptr", hWnd)
    return desktopNum
}
toggleAiWindow() {
    IfWinExist, ChatGPT
    {
        IfWinActive
        {
            WinActivate, Bard
        }
        else
        {
            WinActivate, ChatGPT
        }
    }
    else if WinExist("Bard")
    {
        WinActivate, Bard
    }
}
#if WinActive("ahk_exe msedge.exe")
	!t::
		toggleAiWindow()
	Return
	:*?:/wl::
		pasteText(Clipboard, "https://www.youtube.com/playlist?list=WL")
		Send {Enter}
	Return
	:*?:/wip::
		pasteText(Clipboard, "https://docs.google.com/spreadsheets/d/15jA2uNWueafJU2k2CrGEDYsWR_LYf3CEhxCPes-spyw/edit#gid=2009488278")
		Send {Enter}
	Return
	:*?:;gs::
		Send +{Enter}
		Send Existing sample:
		Send {Space}
	Return
	:*?:;ga::
		Send +{Enter}
		Send Talk about: 
		Send {Space}
	Return
	:*?:;gt::
		Send +{Enter}
		Send Task:
		Send {Space}
	Return
	;Close tab to the right
	+RButton::
		Click R
		Sleep 100
		Loop 5{
			Send {Up}
		}
		Send {Enter}
		Sleep 200
		Send ^w
	Return	
	;MyTe Allowance expenses
	+!a::
		SetKeyDelay, 100
		;Charge code
		Send {Tab}
		Send {Tab}
		Send {Enter}{Down}{Enter}
		Loop 8{
			Send {Tab}
		}
		;Choose type allowance
		Send {Enter}{Down}{Enter}
		;Amount
		Send {Tab}
		Send {Tab}
		Send 200000
		;From
		Loop 4{
			Send +{Tab}
		}
		Send {Space}
	Return
#If WinActive("ahk_exe Code.exe")
	~^s::
		Send ^{F9}
	Return
#If WinActive("ahk_exe studio64.exe")
	+MButton::
		Click R
		Sleep 200
		Loop 3{
			Send {Down}
		}
		Send {Enter}
	Return
	~^s::
		Send !^l
	Return
	~!^l::
	;	Send ^s
	Return
	~!Enter::
	;	KeyWait, Enter, D
	;	Send ^s
	Return
	~Enter::
	;Send ^!l
	;	Send ^s
	Return
	:*?:/pair::
		Send adb pair 192.168.1.:
		Send {Left}
	Return
	:*?:/connect::
		Send adb connect 192.168.1.:
		Send {Left}
	Return
#if WinActive("ahk_exe Guitar Rig 5.exe")
	LCtrl::
		Send {Enter}
		Send {Enter}
		Sleep 40
		Send {Space}
	Return
	RCtrl::
		Sleep 40
		Send {Space}
		Send {Space}
	Return
#if WinActive("ahk_exe brave.exe")
	!x::
		Click Right
		Sleep 200
		Send {Down}
		Send {Enter}
		Sleep 75
		Send ^w
	Return
	MButton::
		dragImage()
	Return
	XButton2::
		Send, {Ctrl Down}{Click}{Ctrl up}
	Return
	;Drag
	!z::
		dragImage()
	Return
	!c::
		untapButtons()
		saveLastWindow()
		saveLastCursor()
		start:=[600, 500]
		ending:=[1805, 799]
		move(start[1],start[2])
		Sleep 100
		drag(start[1],start[2],ending[1],ending[2])
		loadLastCursor()
		focusLastWindow()
	Return
#if
dragImage(){
	untapButtons()
	saveLastWindow()
	saveLastCursor()
	start:=[621, 605]
	ending:=[1805, 799]
	move(start[1], start[2])
	Click, Up
	Click, Down
	Sleep 100
	move(start[1]+2,start[2]+2)
	Sleep 100
	move(ending[1],ending[2])
	Sleep 100
	move(ending[1]+2,ending[2]+2)
	Click, Up
	Sleep 100
	move(ending[1]+4,ending[2]+4)
	Sleep 100
	loadLastCursor()
	focusLastWindow()
	;Sleep 200
	Send ^w
}
#if WinActive("ahk_exe Transistor.exe")
	!4::
		tooltip("clicked")
		Click R
	Return
	!2::
		Send 2
		Click R
	Return
#if
;Mouse function on
;=========================
#Include %a_scriptdir%\___Functions.ahk
Run, %a_scriptdir%\__Emojis.ahk
;#Include ___2nd Keyboard.ahk
