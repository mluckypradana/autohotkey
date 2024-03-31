; Define a dictionary to store the saved clipboard for each key
global savedClipboard := {"key": "value"}

; Function to save the current clipboard to a key
SaveClipboard(key) {
    ; Save the current clipboard to the dictionary
    Send ^c
    ClipWait
    savedClipboard[key] := Clipboard
}

; Function to paste the saved clipboard using a modifier key + the key
PasteSavedClipboard(key, modifier) {
    ; Wait for the target application to become active
    ;WinWaitActive, ahk_class Shell_TrayWnd

    ; Paste the saved clipboard
    Clipboard := savedClipboard[key]
    Send, ^v

    ; Restore the original clipboard contents
    Clipboard := ""
    Clipboard = % savedClipboard[key]
}

; Function to save the current clipboard using a modifier key + any key
^!c::
    ; Wait for the user to press a key
    Send ^c
    ClipWait
    tooltip("Press any key to save clipboard")
    Input, savedKey, L1 M
    savedClipboard[savedKey] := Clipboard
    tooltip("Saved to "+savedKey)
return

; Function to paste the saved clipboard using a modifier key + any key
^!v::
    tooltip("Press saved key to paste clipboard")
    Input, savedKey, L1 M
    Clipboard := savedClipboard[savedKey]
    ClipWait, 100
    Sleep 100
    SendInput, ^v
return
#Include ../___Functions.ahk