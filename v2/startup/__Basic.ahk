#Requires AutoHotkey v2.0
#SingleInstance Force
CoordMode "ToolTip", "Screen"
CoordMode "Pixel", "Screen"
CoordMode "Mouse", "Screen"
SetCapslockState "AlwaysOff"
tip("Reloaded")

#Include %A_ScriptDir%\lib\_expander.ahk
#Include %A_ScriptDir%\lib\_process.ahk
#Include %A_ScriptDir%\lib\_snap.ahk
#Include %A_ScriptDir%\lib\_window-control.ahk
#Include %A_ScriptDir%\app\_onenote.ahk
#Include %A_ScriptDir%\app\_guitarrig.ahk
#Include %A_ScriptDir%\app\_photogallery.ahk
; dir := A_ScriptDir . "\lib\*.ahk"
; Loop Files, dir {
;     tip(A_ScriptDir . "\lib\" . A_LoopFileName)
;     #Include %A_ScriptDir%\lib\%A_LoopFileName%
; }

!Esc:: Reload

:*?:;now:: {
    currentDate := FormatTime(A_Now, "yyyyMMdd")
    Send(currentDate)
    
}

; Set Right Ctrl to Option Menu / Right Click
RAlt::AppsKey

!q:: {
    active_exe := WinGetProcessName("A")
    ProcessClose(active_exe)
}

>!r:: {
    WinGetPos &X, &Y, &WinWidth, &WinHeight, "A"
    MouseMove(X + WinWidth, Y + WinHeight)
    MouseMove(-1, -1, , "R")
}

; Set Right Alt to Option Menu / Right Click
RCtrl::AppsKey

; Ctrl+Alt+Win+Shift+4: Move mouse to top left corner
^!#7:: {
    MouseMove 0, 0
}

*~^!#4:: {
    MouseMove A_ScreenWidth, 0
}

!^+z:: {
    xpos := 0
    ypos := 0
    MouseGetPos &xpos, &ypos
    A_Clipboard := % &xpos% . ", " . % &ypos%
    tip(A_Clipboard)
}

#HotIf WinActive("ahk_class ApplicationFrameWindow")
!e:: SendEvent(get("etsel"))
!u:: SendEvent(get("utsel"))
!p:: SendEvent(get("ptsel"))

#HotIf WinActive("ahk_exe brave.exe")
!z:: {
    WinActivate ("ahk_exe brave.exe")
    MouseGetPos &x, &y
    ;MouseClickDrag "L", 392, 413, 1900, 817, 10000
    SendEvent "{Click " . % &x% . "," . % &y% . " Down}{click 1900, 817 Up}"
    MouseMove % &x%, % &y%
    SLeep 100
    WinActivate ("ahk_exe brave.exe")
    if WInActive("ahk_Exe brave.exe")
        Send "^{w}"
    else {
        Sleep 100
        WinActivate ("ahk_exe brave.exe")
        if WInActive("ahk_Exe brave.exe")
            Send "^{w}"
    }
}

; Function to show a tooltip
tip(text, duration := 1000) {
    ToolTip(text)
    SetTimer () => ToolTip(), duration * -1
}

