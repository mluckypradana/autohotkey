
#Requires AutoHotkey v2.0
#SingleInstance Force

; Use Ctrl + Alt + S as a hotkey for demonstration purposes; you can change it to your preferred hotkey
^+!s::{

    Run "https://www.google.com"
    Sleep 500
    WinMove 0, 0,A_ScreenWidth/2,A_ScreenHeight/2,"A"

    Send "^{n}"
    Sleep 500
    WinMove A_ScreenWidth/2, 0,A_ScreenWidth/2,A_ScreenHeight/2,"A"
    Run "https://www.youtube.com"
    Sleep 500
    Send "^{1}"
    Sleep 500
    Send "^{w}"

    Send "^{n}"
    Sleep 500
    WinMove 0, A_ScreenHeight/2,A_ScreenWidth/2,A_ScreenHeight/2,"A"
    Run "https://shopee.co.id"
    Sleep 500
    Send "^{1}"
    Sleep 200
    Send "^{w}"

    ; active_id := WinGetID("A")
    ; WinActivate


    ; Wait for all Microsoft Edge windows to open
    ; WinWait("Microsoft Edge", , 2)

    ; ; Move and resize the Microsoft Edge windows
    ; WinMove("Microsoft Edge", , 0, 0, A_ScreenWidth / 2, A_ScreenHeight / 2)
    ; WinMove("Microsoft Edge", , A_ScreenWidth / 2, 0, A_ScreenWidth, A_ScreenHeight / 2)
    ; WinMove("Microsoft Edge", , 0, A_ScreenHeight / 2, A_ScreenWidth / 2, A_ScreenHeight)
    ; WinMove("Microsoft Edge", , A_ScreenWidth / 2, A_ScreenHeight / 2, A_ScreenWidth, A_ScreenHeight)

    ; Bring OneNote to the front
    try {
        WinActivate("OneNote")
    } catch {
        ; Handle the exception silently
    }
}